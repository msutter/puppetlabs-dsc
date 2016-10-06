#Requires -Version 4.0

<#
        .SYNOPSIS
        Validates the existence of a file at a specific path.

        .PARAMETER Path
        The location of the file. Supports any path that Test-Path supports.

        .PARAMETER Quiet
        Returns $false if the file does not exist. By default this function throws an exception if the file is missing.

        .EXAMPLE
        Validate-PfxPath -Path '\\server\share\Certificates\mycert.pfx'

        .EXAMPLE
        Validate-PfxPath -Path 'C:\certs\my_missing.pfx' -Quiet

        .EXAMPLE
        'D:\CertRepo\a_cert.pfx' | Validate-PfxPath

        .EXAMPLE
        Get-ChildItem D:\CertRepo\*.pfx | Validate-PfxPath
#>
function Validate-PfxPath 
{
    [CmdletBinding()]
    param(
        [Parameter(
                Mandatory,
                ValueFromPipeline
        )]
        [String[]]
        $Path ,

        [Parameter()]
        [Switch]
        $Quiet
    )

    Process 
    {
        foreach($p in $Path) 
        {
            if ($p | Test-Path -PathType Leaf) 
            {
                $true
            } 
            elseif ($Quiet) 
            {
                $false
            } 
            else 
            {
                throw [System.ArgumentException]"File '$p' not found."
            } 
        }
    }
}

<#
        .SYNOPSIS
        Validates whether a given certificate is valid based on the hash algoritms available on the system.

        .PARAMETER Thumbprint
        One or more thumbprints to validate.

        .PARAMETER Quiet
        Returns $false if the thumbprint is not valid. By default this function throws an exception if validation fails.

        .EXAMPLE
        Validate-Thumbprint fd94e3a5a7991cb6ed3cd5dd01045edf7e2284de

        .EXAMPLE
        Validate-Thumbprint fd94e3a5a7991cb6ed3cd5dd01045edf7e2284de,0000e3a5a7991cb6ed3cd5dd01045edf7e220000 -Quiet

        .EXAMPLE
        gci Cert:\LocalMachine -Recurse | ? { $_.Thumbprint } | select -exp Thumbprint | Validate-Thumbprint -Verbose
#>
function Validate-Thumbprint 
{
    [CmdletBinding()]
    param(
        [Parameter(
                Mandatory,
                ValueFromPipeline
        )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Thumbprint ,

        [Parameter()]
        [Switch]
        $Quiet
    )

    Begin 
    {
        $validHashes = [System.AppDomain]::CurrentDomain.GetAssemblies().GetTypes() |
        Where-Object -FilterScript {
            $_.BaseType.BaseType -eq [System.Security.Cryptography.HashAlgorithm] -and
            ($_.Name -cmatch 'Managed$' -or $_.Name -cmatch 'Provider$')
        } |
        ForEach-Object -Process {
            New-Object -TypeName PSObject -Property @{
                Hash    = $_.BaseType.Name
                BitSize = (New-Object $_).HashSize
            } |
            Add-Member -MemberType ScriptProperty -Name HexLength -Value {
                $this.BitSize / 4
            } -PassThru
        }
    }

    Process 
    {
        foreach($hash in $Thumbprint) 
        {
            $isValid = $false

            foreach($algorithm in $validHashes)
            {
                if ($hash -cmatch "^[a-fA-F0-9]{$($algorithm.HexLength)}$")
                {
                    Write-Verbose -Message "'$hash' is a valid $($algorithm.Hash) hash."
                    $isValid = $true
                }
            }
            
            if ($Quiet -or $isValid)
            {
                $isValid
            }
            else
            {
                throw [System.ArgumentException]"'$hash' is not a valid hash."
            }
        }
    }
}

function Get-TargetResource 
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param(
        [Parameter(Mandatory)]
        [ValidateScript( {$_ | Validate-Thumbprint} )]
        [String]
        $Thumbprint ,

        [Parameter(Mandatory)]
        [ValidateScript( {$_ | Validate-PfxPath} )]
        [String]
        $Path ,

        [Parameter(Mandatory)]
        [ValidateSet('CurrentUser', 'LocalMachine')]
        [String]
        $Location = 'LocalMachine' ,

        [Parameter(Mandatory)]
        [System.String]
        $Store = 'My',

        [Parameter()]
        [bool]
        $Exportable = $false ,

        [Parameter()]
        [PSCredential]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    $CertificateStore = 'Cert:' | 
                        Join-Path -ChildPath $Location | 
                        Join-Path -ChildPath $Store

    if ((Test-Path $CertificateStore) -eq $false)
    {
        throw [System.ArgumentException]"Certificate Store '$Store' not found."
    }
    
    $CheckEnsure = [Bool](
                        $CertificateStore | 
                        Get-ChildItem | 
                        Where-Object -FilterScript {$_.Thumbprint -ieq $Thumbprint}
                    )
    if ($CheckEnsure){$Ensure = 'Present'}
    else {$Ensure = 'Absent'}

    @{
        Thumbprint = $Thumbprint
        Path       = $Path
        Ensure     = $Ensure
    }
}

function Test-TargetResource 
{
    [CmdletBinding()]
    [OutputType([Bool])]
    param(
        [Parameter(Mandatory)]
        [ValidateScript( {$_ | Validate-Thumbprint} )]
        [String]
        $Thumbprint ,

        [Parameter(Mandatory)]
        [ValidateScript( {$_ | Validate-PfxPath} )]
        [String]
        $Path ,

        [Parameter(Mandatory)]
        [ValidateSet('CurrentUser', 'LocalMachine')]
        [String]
        $Location = 'LocalMachine' ,

        [Parameter(Mandatory)]
        [System.String]
        $Store = 'My',

        [Parameter()]
        [bool]
        $Exportable = $false ,

        [Parameter()]
        [PSCredential]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    $result = @(Get-TargetResource @PSBoundParameters)
    if ($Ensure -ne $result.Ensure) { return $false }
    elseif ($Ensure -eq 'Present' -and ($result.Target -ne $Target)) { return $false }
    return $true
}

function Set-TargetResource 
{
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory)]
        [ValidateScript( {$_ | Validate-Thumbprint} )]
        [String]
        $Thumbprint ,

        [Parameter(Mandatory)]
        [ValidateScript( {$_ | Validate-PfxPath} )]
        [String]
        $Path ,

        [Parameter(Mandatory)]
        [ValidateSet('CurrentUser', 'LocalMachine')]
        [String]
        $Location = 'LocalMachine' ,

        [Parameter(Mandatory)]
        [System.String]
        $Store = 'My',

        [Parameter()]
        [bool]
        $Exportable = $false ,

        [Parameter()]
        [PSCredential]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    $certPath = 'Cert:' |
    Join-Path -ChildPath $Location |
    Join-Path -ChildPath $Store


    if ($Ensure -ieq 'Present')
    {
        if ($PSCmdlet.ShouldProcess("Importing PFX '$Path' into '$certPath'")) 
        {
            $param = @{
                Exportable        = $Exportable
                CertStoreLocation = $certPath
                FilePath          = $Path
                Verbose           = $VerbosePreference
            }
            if ($Credential) 
            {
                $param['Password'] = $Credential.Password
            }
            Import-PfxCertificate @param
        }
    }

    elseif ($Ensure -ieq 'Absent')
    {
        Get-ChildItem -Path $certPath | Where-Object {$_.Thumbprint -ieq $thumbprint} | Remove-Item -Force
    }

}

Export-ModuleMember -Function *-TargetResource