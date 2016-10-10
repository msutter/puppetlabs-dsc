function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]  
        [ValidateSet("Internal-HTTP","Internal-HTTPS","External-HTTP","External-HTTPS")] 
        [System.String]  
        $Zone,
        
        [parameter(Mandatory = $true)]  
        [System.String]  
        $DnsName,

        [parameter(Mandatory = $false)] 
        [ValidateSet("Present","Absent")] 
        [System.String] 
        $Ensure = "Present",
        
        [parameter(Mandatory = $false)] 
        [System.Management.Automation.PSCredential] 
        $InstallAccount
    )

    Write-Verbose -Message "Looking up the Office Online Server details for '$Zone' zone"

    $result = Invoke-SPDSCCommand -Credential $InstallAccount `
                                  -Arguments $PSBoundParameters `
                                  -ScriptBlock {
        $params = $args[0]        
        
        $currentZone = Get-SPWOPIZone
        $bindings = Get-SPWOPIBinding -WOPIZone $currentZone

        if ($null -eq $bindings) 
        {
            return @{
                Zone           = $currentZone
                DnsName        = $null
                Ensure         = "Absent"
                InstallAccount = $params.InstallAccount
            }
        } 
        else 
        {
            return @{
                Zone           = $currentZone
                DnsName        = ($bindings | Select-Object -First 1).ServerName
                Ensure         = "Present"
                InstallAccount = $params.InstallAccount
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
        [parameter(Mandatory = $true)]  
        [ValidateSet("Internal-HTTP","Internal-HTTPS","External-HTTP","External-HTTPS")] 
        [System.String]  
        $Zone,
        
        [parameter(Mandatory = $true)]  
        [System.String]  
        $DnsName,

        [parameter(Mandatory = $false)] 
        [ValidateSet("Present","Absent")] 
        [System.String] 
        $Ensure = "Present",

        [parameter(Mandatory = $false)] 
        [System.Management.Automation.PSCredential] 
        $InstallAccount
    )

    $CurrentResults = Get-TargetResource @PSBoundParameters

    if ($Ensure -eq "Present") 
    { 
        if ($DnsName -ne $CurrentResults.DnsName -or $Zone -ne $CurrentResults.Zone) 
        {
            if ([String]::IsNullOrEmpty($CurrentResults.DnsName) -eq $false `
                -or $Zone -ne $CurrentResults.Zone) 
            {
                Write-Verbose -Message ("Removing bindings for zone '$Zone' so new bindings " + `
                                        "can be added")
                Invoke-SPDSCCommand -Credential $InstallAccount `
                                    -Arguments $PSBoundParameters `
                                    -ScriptBlock {
                    $params = $args[0]
                    Get-SPWOPIBinding -WOPIZone $params.Zone | Remove-SPWOPIBinding -Confirm:$false
                }   
            }
            Write-Verbose -Message "Creating new bindings for '$DnsName' and setting zone to '$Zone'"
            Invoke-SPDSCCommand -Credential $InstallAccount `
                                -Arguments $PSBoundParameters `
                                -ScriptBlock {
                $params = $args[0]

                $newParams = @{
                    ServerName = $params.DnsName
                }
                if ($params.Zone.ToLower().EndsWith("http") -eq $true) 
                {
                    $newParams.Add("AllowHTTP", $true)
                }
                New-SPWOPIBinding @newParams
                Set-SPWOPIZone -zone $params.Zone
            }
        }
    }
    
    if ($Ensure -eq "Absent") 
    {
        Write-Verbose -Message "Removing bindings for zone '$Zone'"
        Invoke-SPDSCCommand -Credential $InstallAccount `
                            -Arguments $PSBoundParameters `
                            -ScriptBlock {
            $params = $args[0]
            Get-SPWOPIBinding -WOPIZone $params.Zone | Remove-SPWOPIBinding -Confirm:$false
        }
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]  
        [ValidateSet("Internal-HTTP","Internal-HTTPS","External-HTTP","External-HTTPS")] 
        [System.String]  
        $Zone,
        
        [parameter(Mandatory = $true)]  
        [System.String]  
        $DnsName,

        [parameter(Mandatory = $false)] 
        [ValidateSet("Present","Absent")] 
        [System.String] 
        $Ensure = "Present",

        [parameter(Mandatory = $false)] 
        [System.Management.Automation.PSCredential] 
        $InstallAccount
    )

    $CurrentValues = Get-TargetResource @PSBoundParameters
    $PSBoundParameters.Ensure = $Ensure

    Write-Verbose -Message "Testing Office Online Server details for '$Zone' zone"
    
    $paramsToCheck = @("Ensure")   
    if ($Ensure -eq "Present") 
    {
        $paramsToCheck += @("Zone","DnsName")
    }
    return Test-SPDscParameterState -CurrentValues $CurrentValues `
                                    -DesiredValues $PSBoundParameters `
                                    -ValuesToCheck $paramsToCheck
}

Export-ModuleMember -Function *-TargetResource
