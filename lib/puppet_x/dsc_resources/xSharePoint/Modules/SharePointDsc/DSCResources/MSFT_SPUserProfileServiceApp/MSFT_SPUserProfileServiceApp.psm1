function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]  [System.String] $Name,
        [parameter(Mandatory = $true)]  [System.String] $ApplicationPool,
        [parameter(Mandatory = $false)] [System.Management.Automation.PSCredential] $FarmAccount,
        [parameter(Mandatory = $false)] [System.String] $MySiteHostLocation,
        [parameter(Mandatory = $false)] [System.String] $ProfileDBName,
        [parameter(Mandatory = $false)] [System.String] $ProfileDBServer,
        [parameter(Mandatory = $false)] [System.String] $SocialDBName,
        [parameter(Mandatory = $false)] [System.String] $SocialDBServer,
        [parameter(Mandatory = $false)] [System.String] $SyncDBName,
        [parameter(Mandatory = $false)] [System.String] $SyncDBServer,
        [parameter(Mandatory = $false)] [ValidateSet("Present","Absent")] [System.String] $Ensure = "Present",
        [parameter(Mandatory = $false)] [System.Management.Automation.PSCredential] $InstallAccount
    )

    Write-Verbose -Message "Getting user profile service application $Name"

    $result = Invoke-SPDSCCommand -Credential $InstallAccount -Arguments $PSBoundParameters -ScriptBlock {
        $params = $args[0]

        $serviceApps = Get-SPServiceApplication -Name $params.Name -ErrorAction SilentlyContinue
        $nullReturn = @{
            Name = $params.Name
            Ensure = "Absent"
        } 
        if ($null -eq $serviceApps) { 
            return $nullReturn 
        }
        $serviceApp = $serviceApps | Where-Object { $_.TypeName -eq "User Profile Service Application" }

        If ($null -eq $serviceApp)
        {
            return $nullReturn
        }
        else
        {
            $databases = @{}
            $propData = $serviceApp.GetType().GetProperties([System.Reflection.BindingFlags]::Instance -bor [System.Reflection.BindingFlags]::NonPublic)

            $socialProp = $propData | Where-Object {$_.Name -eq "SocialDatabase"}
            $databases.Add("SocialDatabase", $socialProp.GetValue($serviceApp)) 

            $profileProp = $propData | Where-Object {$_.Name -eq "ProfileDatabase"}
            $databases.Add("ProfileDatabase", $profileProp.GetValue($serviceApp))

            $syncProp = $propData | Where-Object {$_.Name -eq "SynchronizationDatabase"}
            $databases.Add("SynchronizationDatabase", $syncProp.GetValue($serviceApp))

            $spFarm = Get-SPFarm

            if ($params.FarmAccount.UserName -eq $spFarm.DefaultServiceAccount.Name) {
                $farmAccount = $params.FarmAccount
            } else {
                $farmAccount = $spFarm.DefaultServiceAccount.Name
            }

            return @{
                Name = $serviceApp.DisplayName
                ApplicationPool = $serviceApp.ApplicationPool.Name
                FarmAccount = $farmAccount
                MySiteHostLocation = $params.MySiteHostLocation
                ProfileDBName = $databases.ProfileDatabase.Name
                ProfileDBServer = $databases.ProfileDatabase.Server.Name
                SocialDBName = $databases.SocialDatabase.Name
                SocialDBServer = $databases.SocialDatabase.Server.Name
                SyncDBName = $databases.SynchronizationDatabase.Name
                SyncDBServer = $databases.SynchronizationDatabase.Server.Name
                InstallAccount = $params.InstallAccount
                Ensure = "Present"
            }
        }
    }
    return $result
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]  [System.String] $Name,
        [parameter(Mandatory = $true)]  [System.String] $ApplicationPool,
        [parameter(Mandatory = $false)] [System.Management.Automation.PSCredential] $FarmAccount,
        [parameter(Mandatory = $false)] [System.String] $MySiteHostLocation,
        [parameter(Mandatory = $false)] [System.String] $ProfileDBName,
        [parameter(Mandatory = $false)] [System.String] $ProfileDBServer,
        [parameter(Mandatory = $false)] [System.String] $SocialDBName,
        [parameter(Mandatory = $false)] [System.String] $SocialDBServer,
        [parameter(Mandatory = $false)] [System.String] $SyncDBName,
        [parameter(Mandatory = $false)] [System.String] $SyncDBServer,
        [parameter(Mandatory = $false)] [ValidateSet("Present","Absent")] [System.String] $Ensure = "Present",
        [parameter(Mandatory = $false)] [System.Management.Automation.PSCredential] $InstallAccount
    )

    if ($Ensure -eq "Present") {
        
        if ($PSBoundParameters.ContainsKey("FarmAccount") -eq $false) {
            throw "Unable to provision the user profile service without the Farm Account. Please specify the FarmAccount parameter and try again"
            return
        }
        
        Write-Verbose -Message "Creating user profile service application $Name"
        
        # Add the FarmAccount to the local Administrators group, if it's not already there
        $isLocalAdmin = Test-SPDSCUserIsLocalAdmin -UserName $FarmAccount.UserName

        if (!$isLocalAdmin)
        {
            Add-SPDSCUserToLocalAdmin -UserName $FarmAccount.UserName
        }

        $result = Invoke-SPDSCCommand -Credential $FarmAccount -Arguments $PSBoundParameters -ScriptBlock {
            $params = $args[0]
            

            if ($params.ContainsKey("InstallAccount")) { $params.Remove("InstallAccount") | Out-Null }
            if ($params.ContainsKey("Ensure")) { $params.Remove("Ensure") | Out-Null }
            $params.Remove("FarmAccount") | Out-Null

            $params = Rename-SPDSCParamValue -params $params -oldName "SyncDBName" -newName "ProfileSyncDBName"
            $params = Rename-SPDSCParamValue -params $params -oldName "SyncDBServer" -newName "ProfileSyncDBServer"

            $serviceApps = Get-SPServiceApplication -Name $params.Name -ErrorAction SilentlyContinue 
            if ($null -eq $serviceApps) { 
                $app = New-SPProfileServiceApplication @params
                if ($null -ne $app) {
                    New-SPProfileServiceApplicationProxy -Name "$($params.Name) Proxy" -ServiceApplication $app -DefaultProxyGroup
                }
            }
        }

        # Remove the FarmAccount from the local Administrators group, if it was added above
        if (!$isLocalAdmin)
        {
            Remove-SPDSCUserToLocalAdmin -UserName $FarmAccount.UserName
        }
    }
    
    if ($Ensure -eq "Absent") {
        Write-Verbose -Message "Removing user profile service application $Name"
        Invoke-SPDSCCommand -Credential $InstallAccount -Arguments $PSBoundParameters -ScriptBlock {
            $params = $args[0]
            
            $service = Get-SPServiceApplication -Name $params.Name `
                    | Where-Object { $_.TypeName -eq "User Profile Service Application" }
            Remove-SPServiceApplication $service -Confirm:$false
        }
    }        
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]  [System.String] $Name,
        [parameter(Mandatory = $true)]  [System.String] $ApplicationPool,
        [parameter(Mandatory = $false)] [System.Management.Automation.PSCredential] $FarmAccount,
        [parameter(Mandatory = $false)] [System.String] $MySiteHostLocation,
        [parameter(Mandatory = $false)] [System.String] $ProfileDBName,
        [parameter(Mandatory = $false)] [System.String] $ProfileDBServer,
        [parameter(Mandatory = $false)] [System.String] $SocialDBName,
        [parameter(Mandatory = $false)] [System.String] $SocialDBServer,
        [parameter(Mandatory = $false)] [System.String] $SyncDBName,
        [parameter(Mandatory = $false)] [System.String] $SyncDBServer,
        [parameter(Mandatory = $false)] [ValidateSet("Present","Absent")] [System.String] $Ensure = "Present",
        [parameter(Mandatory = $false)] [System.Management.Automation.PSCredential] $InstallAccount
    )

    $CurrentValues = Get-TargetResource @PSBoundParameters
    Write-Verbose -Message "Testing for user profile service application $Name"
    $PSBoundParameters.Ensure = $Ensure
    return Test-SPDSCSpecificParameters -CurrentValues $CurrentValues -DesiredValues $PSBoundParameters -ValuesToCheck @("Name", "Ensure")
}

Export-ModuleMember -Function *-TargetResource

