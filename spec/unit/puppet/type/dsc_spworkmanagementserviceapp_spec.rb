#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spworkmanagementserviceapp) do

  let :dsc_spworkmanagementserviceapp do
    Puppet::Type.type(:dsc_spworkmanagementserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spworkmanagementserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_ensure => 'Present',
      :dsc_applicationpool => 'foo',
      :dsc_minimumtimebetweenewssyncsubscriptionsearches => 32,
      :dsc_minimumtimebetweenproviderrefreshes => 32,
      :dsc_minimumtimebetweensearchqueries => 32,
      :dsc_numberofsubscriptionsyncsperewssyncrun => 32,
      :dsc_numberofusersewssyncwillprocessatonce => 32,
      :dsc_numberofusersperewssyncbatch => 32,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spworkmanagementserviceapp.to_s).to eq("Dsc_spworkmanagementserviceapp[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spworkmanagementserviceapp[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spworkmanagementserviceapp[:dsc_name]
    expect { Puppet::Type.type(:dsc_spworkmanagementserviceapp).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spworkmanagementserviceapp[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spworkmanagementserviceapp[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spworkmanagementserviceapp[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spworkmanagementserviceapp[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spworkmanagementserviceapp[:dsc_ensure] = 'Present'
    expect(dsc_spworkmanagementserviceapp[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spworkmanagementserviceapp[:dsc_ensure] = 'present'
    expect(dsc_spworkmanagementserviceapp[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spworkmanagementserviceapp[:dsc_ensure] = 'present'
    expect(dsc_spworkmanagementserviceapp[:ensure]).to eq(dsc_spworkmanagementserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spworkmanagementserviceapp[:dsc_ensure] = 'Absent'
    expect(dsc_spworkmanagementserviceapp[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spworkmanagementserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_spworkmanagementserviceapp[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spworkmanagementserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_spworkmanagementserviceapp[:ensure]).to eq(dsc_spworkmanagementserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spworkmanagementserviceapp[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spworkmanagementserviceapp[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spworkmanagementserviceapp[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spworkmanagementserviceapp[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spworkmanagementserviceapp[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_spworkmanagementserviceapp[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_spworkmanagementserviceapp[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_spworkmanagementserviceapp[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_spworkmanagementserviceapp[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_minimumtimebetweenewssyncsubscriptionsearches' do
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minimumtimebetweenewssyncsubscriptionsearches' do
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_minimumtimebetweenewssyncsubscriptionsearches' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches] = 32
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_minimumtimebetweenewssyncsubscriptionsearches' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweenewssyncsubscriptionsearches' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches] = '16'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches]).to eq(16)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweenewssyncsubscriptionsearches' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches] = '32'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches]).to eq(32)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweenewssyncsubscriptionsearches' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches] = '64'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenewssyncsubscriptionsearches]).to eq(64)
  end

  it 'should not accept array for dsc_minimumtimebetweenproviderrefreshes' do
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minimumtimebetweenproviderrefreshes' do
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_minimumtimebetweenproviderrefreshes' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes] = 32
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_minimumtimebetweenproviderrefreshes' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweenproviderrefreshes' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes] = '16'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes]).to eq(16)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweenproviderrefreshes' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes] = '32'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes]).to eq(32)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweenproviderrefreshes' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes] = '64'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweenproviderrefreshes]).to eq(64)
  end

  it 'should not accept array for dsc_minimumtimebetweensearchqueries' do
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minimumtimebetweensearchqueries' do
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_minimumtimebetweensearchqueries' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries] = 32
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_minimumtimebetweensearchqueries' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweensearchqueries' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries] = '16'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries]).to eq(16)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweensearchqueries' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries] = '32'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries]).to eq(32)
  end

  it 'should accept string-like uint for dsc_minimumtimebetweensearchqueries' do
    dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries] = '64'
    expect(dsc_spworkmanagementserviceapp[:dsc_minimumtimebetweensearchqueries]).to eq(64)
  end

  it 'should not accept array for dsc_numberofsubscriptionsyncsperewssyncrun' do
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_numberofsubscriptionsyncsperewssyncrun' do
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_numberofsubscriptionsyncsperewssyncrun' do
    dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun] = 32
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_numberofsubscriptionsyncsperewssyncrun' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_numberofsubscriptionsyncsperewssyncrun' do
    dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun] = '16'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun]).to eq(16)
  end

  it 'should accept string-like uint for dsc_numberofsubscriptionsyncsperewssyncrun' do
    dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun] = '32'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun]).to eq(32)
  end

  it 'should accept string-like uint for dsc_numberofsubscriptionsyncsperewssyncrun' do
    dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun] = '64'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofsubscriptionsyncsperewssyncrun]).to eq(64)
  end

  it 'should not accept array for dsc_numberofusersewssyncwillprocessatonce' do
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_numberofusersewssyncwillprocessatonce' do
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_numberofusersewssyncwillprocessatonce' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce] = 32
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_numberofusersewssyncwillprocessatonce' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_numberofusersewssyncwillprocessatonce' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce] = '16'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce]).to eq(16)
  end

  it 'should accept string-like uint for dsc_numberofusersewssyncwillprocessatonce' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce] = '32'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce]).to eq(32)
  end

  it 'should accept string-like uint for dsc_numberofusersewssyncwillprocessatonce' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce] = '64'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersewssyncwillprocessatonce]).to eq(64)
  end

  it 'should not accept array for dsc_numberofusersperewssyncbatch' do
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_numberofusersperewssyncbatch' do
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_numberofusersperewssyncbatch' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch] = 32
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_numberofusersperewssyncbatch' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_numberofusersperewssyncbatch' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch] = '16'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch]).to eq(16)
  end

  it 'should accept string-like uint for dsc_numberofusersperewssyncbatch' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch] = '32'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch]).to eq(32)
  end

  it 'should accept string-like uint for dsc_numberofusersperewssyncbatch' do
    dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch] = '64'
    expect(dsc_spworkmanagementserviceapp[:dsc_numberofusersperewssyncbatch]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spworkmanagementserviceapp[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spworkmanagementserviceapp[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spworkmanagementserviceapp[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spworkmanagementserviceapp[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spworkmanagementserviceapp[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spworkmanagementserviceapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spworkmanagementserviceapp)
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
        dsc_spworkmanagementserviceapp.original_parameters[:dsc_ensure] = 'present'
        dsc_spworkmanagementserviceapp[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spworkmanagementserviceapp)
      end

      it "should update :ensure to :present" do
        expect(dsc_spworkmanagementserviceapp[:ensure]).to eq(:present)
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
        dsc_spworkmanagementserviceapp.original_parameters[:dsc_ensure] = 'absent'
        dsc_spworkmanagementserviceapp[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spworkmanagementserviceapp)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spworkmanagementserviceapp[:ensure]).to eq(:absent)
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
