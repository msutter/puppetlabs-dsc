function Get-SPDSCWebApplicationBlockedFileTypes {
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param(
        [parameter(Mandatory = $true)] $WebApplication
    )
    $result = @()
    $WebApplication.BlockedFileExtensions | ForEach-Object { $result += $_ }
    return @{
       Blocked = $result
    }
}

function Set-SPDSCWebApplicationBlockedFileTypes {
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true)] $WebApplication,
        [parameter(Mandatory = $true)] $Settings
    )
    
    if (($Settings.ContainsKey("Blocked") -eq $true) -and (($Settings.ContainsKey("EnsureBlocked") -eq $true) -or ($Settings.ContainsKey("EnsureAllowed") -eq $true))) {
        throw "Blocked file types must use either the 'blocked' property or the 'EnsureBlocked' and/or 'EnsureAllowed' properties, but not both."
    }

    if (($Settings.ContainsKey("Blocked") -eq $false) -and ($Settings.ContainsKey("EnsureBlocked") -eq $false) -and ($Settings.ContainsKey("EnsureAllowed") -eq $false)) {
        throw "Blocked file types must specify at least one property (either 'Blocked, 'EnsureBlocked' or 'EnsureAllowed')"
    }

    if($Settings.ContainsKey("Blocked") -eq $true) {
        $WebApplication.BlockedFileExtensions.Clear(); 
        $Settings.Blocked | ForEach-Object {
            $WebApplication.BlockedFileExtensions.Add($_.ToLower());
        }
    }

    if($Settings.ContainsKey("EnsureBlocked") -eq $true) {
        $Settings.EnsureBlocked | ForEach-Object {
            if(!$WebApplication.BlockedFileExtensions.Contains($_.ToLower())){
                $WebApplication.BlockedFileExtensions.Add($_.ToLower());
            }
        }
    }

    if($Settings.ContainsKey("EnsureAllowed") -eq $true) {
        $Settings.EnsureAllowed | ForEach-Object {
            if($WebApplication.BlockedFileExtensions.Contains($_.ToLower())){
                $WebApplication.BlockedFileExtensions.Remove($_.ToLower());
            }
        }
    }
}

function Test-SPDSCWebApplicationBlockedFileTypes {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param(
        [parameter(Mandatory = $true)] $CurrentSettings,
        [parameter(Mandatory = $true)] $DesiredSettings
    )
    if (($DesiredSettings.ContainsKey("Blocked") -eq $true) -and (($DesiredSettings.ContainsKey("EnsureBlocked") -eq $true) -or ($DesiredSettings.ContainsKey("EnsureAllowed") -eq $true))) {
        throw "Blocked file types must use either the 'blocked' property or the 'EnsureBlocked' and/or 'EnsureAllowed' properties, but not both."
    }

    if (($DesiredSettings.ContainsKey("Blocked") -eq $false) -and ($DesiredSettings.ContainsKey("EnsureBlocked") -eq $false) -and ($DesiredSettings.ContainsKey("EnsureAllowed") -eq $false)) {
        throw "Blocked file types must specify at least one property (either 'Blocked, 'EnsureBlocked' or 'EnsureAllowed')"
    }

    if($DesiredSettings.ContainsKey("Blocked") -eq $true) {
        $compareResult = Compare-Object -ReferenceObject $CurrentSettings.Blocked -DifferenceObject $DesiredSettings.Blocked
        if ($compareResult -eq $null) { return $true } else { return $false }
    }
    
    if($DesiredSettings.ContainsKey("EnsureBlocked") -eq $true) {
        $itemsToAdd = Compare-Object -ReferenceObject $CurrentSettings.Blocked -DifferenceObject $DesiredSettings.EnsureBlocked | Where-Object { $_.SideIndicator -eq "=>"}
        if ($itemsToAdd -ne $null) { return $false }
    }

    if($DesiredSettings.ContainsKey("EnsureAllowed") -eq $true) {
        $itemsToRemove = Compare-Object -ReferenceObject $CurrentSettings.Blocked -DifferenceObject $DesiredSettings.EnsureAllowed -ExcludeDifferent -IncludeEqual
        if ($itemsToRemove -ne $null) { return $false } 
    }

    return $true
}

