#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_sptrustedidentitytokenissuer) do

  let :dsc_sptrustedidentitytokenissuer do
    Puppet::Type.type(:dsc_sptrustedidentitytokenissuer).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_sptrustedidentitytokenissuer).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_description => 'foo',
      :dsc_realm => 'foo',
      :dsc_signinurl => 'foo',
      :dsc_identifierclaim => 'foo',
      :dsc_claimsmappings => {"Name"=>"foo", "IncomingClaimType"=>"foo", "LocalClaimType"=>"foo"},
      :dsc_signingcertificatethumbprint => 'foo',
      :dsc_claimprovidername => 'foo',
      :dsc_providersignouturi => 'foo',
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_sptrustedidentitytokenissuer.to_s).to eq("Dsc_sptrustedidentitytokenissuer[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_sptrustedidentitytokenissuer[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_sptrustedidentitytokenissuer[:dsc_name]
    expect { Puppet::Type.type(:dsc_sptrustedidentitytokenissuer).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_realm' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_realm] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_realm' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_realm] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_realm' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_realm] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_realm' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_realm] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signinurl' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signinurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signinurl' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signinurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signinurl' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signinurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signinurl' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signinurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_identifierclaim' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_identifierclaim] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identifierclaim' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_identifierclaim] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identifierclaim' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_identifierclaim] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identifierclaim' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_identifierclaim] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_claimsmappings' do
    dsc_sptrustedidentitytokenissuer[:dsc_claimsmappings] = {"Name"=>"foo", "IncomingClaimType"=>"foo", "LocalClaimType"=>"foo"}
    expect(dsc_sptrustedidentitytokenissuer[:dsc_claimsmappings]).to eq([{"Name"=>"foo", "IncomingClaimType"=>"foo", "LocalClaimType"=>"foo"}])
  end

  it 'should accept a an array of hashes for dsc_claimsmappings' do
    dsc_sptrustedidentitytokenissuer[:dsc_claimsmappings] = [{"Name"=>"foo", "IncomingClaimType"=>"foo", "LocalClaimType"=>"foo"}]
    expect(dsc_sptrustedidentitytokenissuer[:dsc_claimsmappings]).to eq([{"Name"=>"foo", "IncomingClaimType"=>"foo", "LocalClaimType"=>"foo"}])
  end

  it 'should not accept boolean for dsc_claimsmappings' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_claimsmappings] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_claimsmappings' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_claimsmappings] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_claimsmappings' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_claimsmappings] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_signingcertificatethumbprint' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signingcertificatethumbprint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_signingcertificatethumbprint' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signingcertificatethumbprint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_signingcertificatethumbprint' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signingcertificatethumbprint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_signingcertificatethumbprint' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_signingcertificatethumbprint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_claimprovidername' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_claimprovidername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_claimprovidername' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_claimprovidername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_claimprovidername' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_claimprovidername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_claimprovidername' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_claimprovidername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_providersignouturi' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_providersignouturi] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_providersignouturi' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_providersignouturi] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_providersignouturi' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_providersignouturi] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_providersignouturi' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_providersignouturi] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'Present'
    expect(dsc_sptrustedidentitytokenissuer[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'present'
    expect(dsc_sptrustedidentitytokenissuer[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'present'
    expect(dsc_sptrustedidentitytokenissuer[:ensure]).to eq(dsc_sptrustedidentitytokenissuer[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'Absent'
    expect(dsc_sptrustedidentitytokenissuer[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'absent'
    expect(dsc_sptrustedidentitytokenissuer[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'absent'
    expect(dsc_sptrustedidentitytokenissuer[:ensure]).to eq(dsc_sptrustedidentitytokenissuer[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_sptrustedidentitytokenissuer[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_sptrustedidentitytokenissuer)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_sptrustedidentitytokenissuer)
    end

    describe "when dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_sptrustedidentitytokenissuer.original_parameters[:dsc_ensure] = 'present'
        dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_sptrustedidentitytokenissuer)
      end

      it "should update :ensure to :present" do
        expect(dsc_sptrustedidentitytokenissuer[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_sptrustedidentitytokenissuer.original_parameters[:dsc_ensure] = 'absent'
        dsc_sptrustedidentitytokenissuer[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_sptrustedidentitytokenissuer)
      end

      it "should update :ensure to :absent" do
        expect(dsc_sptrustedidentitytokenissuer[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
