## Resource Types included with DSC module
For any system this module is installed on, use
`Puppet describe typename` for more information.

#### WMF Core Types

Puppet Type | DSC Resource
----------- | -----------------
dsc_archive | [Archive](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ArchiveResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ArchiveResource/MSFT_ArchiveResource.schema.mof
dsc_environment | [Environment](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_EnvironmentResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_EnvironmentResource/MSFT_EnvironmentResource.schema.mof
dsc_file | [File](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_FileDirectoryConfiguration) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_FileDirectoryConfiguration/MSFT_FileDirectoryConfiguration.schema.mof
dsc_group | [Group](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_GroupResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_GroupResource/MSFT_GroupResource.schema.mof
dsc_log | [Log](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_LogResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_LogResource/MSFT_LogResource.schema.mof
dsc_package | [Package](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_PackageResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_PackageResource/MSFT_PackageResource.schema.mof
dsc_windowsprocess | [WindowsProcess](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ProcessResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ProcessResource/MSFT_ProcessResource.schema.mof
dsc_registry | [Registry](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RegistryResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RegistryResource/MSFT_RegistryResource.schema.mof
dsc_windowsfeature | [WindowsFeature](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RoleResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_RoleResource/MSFT_RoleResource.schema.mof
dsc_script | [Script](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ScriptResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ScriptResource/MSFT_ScriptResource.schema.mof
dsc_service | [Service](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ServiceResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ServiceResource/MSFT_ServiceResource.schema.mof
dsc_user | [User](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_UserResource) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_UserResource/MSFT_UserResource.schema.mof
dsc_windowsoptionalfeature | [WindowsOptionalFeature](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_WindowsOptionalFeature) | import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_WindowsOptionalFeature/MSFT_WindowsOptionalFeature.schema.mof
dsc_systemlocale | [SystemLocale](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/build/vendor/wmf_dsc_resources/SystemLocaleDsc/DSCResources/MSFT_SystemLocale) | import/dsc_resources/SystemLocaleDsc/DSCResources/MSFT_SystemLocale/MSFT_SystemLocale.schema.mof

#### Community x Prefixed types

##### xActiveDirectory

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xadcomputer | [xADComputer](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADComputer) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaddomain | [xADDomain](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomain) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaddomaincontroller | [xADDomainController](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomainController) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaddomaindefaultpasswordpolicy | [xADDomainDefaultPasswordPolicy](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomainDefaultPasswordPolicy) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaddomaintrust | [xADDomainTrust](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomainTrust) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xadgroup | [xADGroup](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADGroup) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xadorganizationalunit | [xADOrganizationalUnit](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADOrganizationalUnit) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xadrecyclebin | [xADRecycleBin](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADRecycleBin) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xaduser | [xADUser](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADUser) | [repo](https://github.com/PowerShell/xActiveDirectory)
dsc_xwaitforaddomain | [xWaitForADDomain](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xActiveDirectory/DSCResources/MSFT_xWaitForADDomain) | [repo](https://github.com/PowerShell/xActiveDirectory)

##### xAdcsDeployment

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xadcscertificationauthority | [xAdcsCertificationAuthority](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/DSCResources/MSFT_xAdcsCertificationAuthority) | [repo](https://github.com/PowerShell/xAdcsDeployment)
dsc_xadcsonlineresponder | [xAdcsOnlineResponder](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/DSCResources/MSFT_xAdcsOnlineResponder) | [repo](https://github.com/PowerShell/xAdcsDeployment)
dsc_xadcswebenrollment | [xAdcsWebEnrollment](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/DSCResources/MSFT_xAdcsWebEnrollment) | [repo](https://github.com/PowerShell/xAdcsDeployment)

##### xCertificateServices

Puppet Type | DSC Resource | Github Repo
----------- | ----------------- | -----
dsc_xadcscertificationauthority | [xAdcsCertificationAuthority](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/xCertificateServices/DSCResources/MSFT_xAdcsCertificationAuthority) | [repo](https://github.com/PowerShell/xCertificateServices)
dsc_xadcsonlineresponder | [xAdcsOnlineResponder](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/xCertificateServices/DSCResources/MSFT_xAdcsOnlineResponder) | [repo](https://github.com/PowerShell/xCertificateServices)
dsc_xadcswebenrollment | [xAdcsWebEnrollment](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/lib/puppet_x/dsc_resources/xAdcsDeployment/xCertificateServices/DSCResources/MSFT_xAdcsWebEnrollment) | [repo](https://github.com/PowerShell/xCertificateServices)

