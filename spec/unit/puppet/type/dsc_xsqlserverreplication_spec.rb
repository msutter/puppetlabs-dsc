#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverreplication) do

  let :dsc_xsqlserverreplication do
    Puppet::Type.type(:dsc_xsqlserverreplication).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverreplication).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_ensure => 'Present',
      :dsc_distributormode => 'Local',
      :dsc_adminlinkcredentials => {"user"=>"user", "password"=>"password"},
      :dsc_distributiondbname => 'foo',
      :dsc_remotedistributor => 'foo',
      :dsc_workingdirectory => 'foo',
      :dsc_usetrustedconnection => true,
      :dsc_uninstallwithforce => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverreplication.to_s).to eq("Dsc_xsqlserverreplication[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlserverreplication[:ensure]).to eq :present
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverreplication[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverreplication).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverreplication[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverreplication[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverreplication[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverreplication[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlserverreplication[:dsc_ensure] = 'Present'
    expect(dsc_xsqlserverreplication[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlserverreplication[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverreplication[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverreplication[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverreplication[:ensure]).to eq(dsc_xsqlserverreplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlserverreplication[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlserverreplication[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlserverreplication[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverreplication[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverreplication[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverreplication[:ensure]).to eq(dsc_xsqlserverreplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverreplication[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlserverreplication[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlserverreplication[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlserverreplication[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlserverreplication[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_distributormode predefined value Local' do
    dsc_xsqlserverreplication[:dsc_distributormode] = 'Local'
    expect(dsc_xsqlserverreplication[:dsc_distributormode]).to eq('Local')
  end

  it 'should accept dsc_distributormode predefined value local' do
    dsc_xsqlserverreplication[:dsc_distributormode] = 'local'
    expect(dsc_xsqlserverreplication[:dsc_distributormode]).to eq('local')
  end

  it 'should accept dsc_distributormode predefined value Remote' do
    dsc_xsqlserverreplication[:dsc_distributormode] = 'Remote'
    expect(dsc_xsqlserverreplication[:dsc_distributormode]).to eq('Remote')
  end

  it 'should accept dsc_distributormode predefined value remote' do
    dsc_xsqlserverreplication[:dsc_distributormode] = 'remote'
    expect(dsc_xsqlserverreplication[:dsc_distributormode]).to eq('remote')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverreplication[:dsc_distributormode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_distributormode' do
    expect{dsc_xsqlserverreplication[:dsc_distributormode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_distributormode' do
    expect{dsc_xsqlserverreplication[:dsc_distributormode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_distributormode' do
    expect{dsc_xsqlserverreplication[:dsc_distributormode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_distributormode' do
    expect{dsc_xsqlserverreplication[:dsc_distributormode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_adminlinkcredentials" do
    expect{dsc_xsqlserverreplication[:dsc_adminlinkcredentials] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminlinkcredentials' do
    expect{dsc_xsqlserverreplication[:dsc_adminlinkcredentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminlinkcredentials' do
    expect{dsc_xsqlserverreplication[:dsc_adminlinkcredentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminlinkcredentials' do
    expect{dsc_xsqlserverreplication[:dsc_adminlinkcredentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminlinkcredentials' do
    expect{dsc_xsqlserverreplication[:dsc_adminlinkcredentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_distributiondbname' do
    expect{dsc_xsqlserverreplication[:dsc_distributiondbname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_distributiondbname' do
    expect{dsc_xsqlserverreplication[:dsc_distributiondbname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_distributiondbname' do
    expect{dsc_xsqlserverreplication[:dsc_distributiondbname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_distributiondbname' do
    expect{dsc_xsqlserverreplication[:dsc_distributiondbname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_remotedistributor' do
    expect{dsc_xsqlserverreplication[:dsc_remotedistributor] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_remotedistributor' do
    expect{dsc_xsqlserverreplication[:dsc_remotedistributor] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remotedistributor' do
    expect{dsc_xsqlserverreplication[:dsc_remotedistributor] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remotedistributor' do
    expect{dsc_xsqlserverreplication[:dsc_remotedistributor] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_workingdirectory' do
    expect{dsc_xsqlserverreplication[:dsc_workingdirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_workingdirectory' do
    expect{dsc_xsqlserverreplication[:dsc_workingdirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_workingdirectory' do
    expect{dsc_xsqlserverreplication[:dsc_workingdirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_workingdirectory' do
    expect{dsc_xsqlserverreplication[:dsc_workingdirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usetrustedconnection' do
    expect{dsc_xsqlserverreplication[:dsc_usetrustedconnection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usetrustedconnection' do
    dsc_xsqlserverreplication[:dsc_usetrustedconnection] = true
    expect(dsc_xsqlserverreplication[:dsc_usetrustedconnection]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usetrustedconnection" do
    dsc_xsqlserverreplication[:dsc_usetrustedconnection] = 'true'
    expect(dsc_xsqlserverreplication[:dsc_usetrustedconnection]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usetrustedconnection" do
    dsc_xsqlserverreplication[:dsc_usetrustedconnection] = 'false'
    expect(dsc_xsqlserverreplication[:dsc_usetrustedconnection]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usetrustedconnection" do
    dsc_xsqlserverreplication[:dsc_usetrustedconnection] = 'True'
    expect(dsc_xsqlserverreplication[:dsc_usetrustedconnection]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usetrustedconnection" do
    dsc_xsqlserverreplication[:dsc_usetrustedconnection] = 'False'
    expect(dsc_xsqlserverreplication[:dsc_usetrustedconnection]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usetrustedconnection" do
    dsc_xsqlserverreplication[:dsc_usetrustedconnection] = :true
    expect(dsc_xsqlserverreplication[:dsc_usetrustedconnection]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usetrustedconnection" do
    dsc_xsqlserverreplication[:dsc_usetrustedconnection] = :false
    expect(dsc_xsqlserverreplication[:dsc_usetrustedconnection]).to eq(false)
  end

  it 'should not accept int for dsc_usetrustedconnection' do
    expect{dsc_xsqlserverreplication[:dsc_usetrustedconnection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usetrustedconnection' do
    expect{dsc_xsqlserverreplication[:dsc_usetrustedconnection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_uninstallwithforce' do
    expect{dsc_xsqlserverreplication[:dsc_uninstallwithforce] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_uninstallwithforce' do
    dsc_xsqlserverreplication[:dsc_uninstallwithforce] = true
    expect(dsc_xsqlserverreplication[:dsc_uninstallwithforce]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_uninstallwithforce" do
    dsc_xsqlserverreplication[:dsc_uninstallwithforce] = 'true'
    expect(dsc_xsqlserverreplication[:dsc_uninstallwithforce]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_uninstallwithforce" do
    dsc_xsqlserverreplication[:dsc_uninstallwithforce] = 'false'
    expect(dsc_xsqlserverreplication[:dsc_uninstallwithforce]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_uninstallwithforce" do
    dsc_xsqlserverreplication[:dsc_uninstallwithforce] = 'True'
    expect(dsc_xsqlserverreplication[:dsc_uninstallwithforce]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_uninstallwithforce" do
    dsc_xsqlserverreplication[:dsc_uninstallwithforce] = 'False'
    expect(dsc_xsqlserverreplication[:dsc_uninstallwithforce]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_uninstallwithforce" do
    dsc_xsqlserverreplication[:dsc_uninstallwithforce] = :true
    expect(dsc_xsqlserverreplication[:dsc_uninstallwithforce]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_uninstallwithforce" do
    dsc_xsqlserverreplication[:dsc_uninstallwithforce] = :false
    expect(dsc_xsqlserverreplication[:dsc_uninstallwithforce]).to eq(false)
  end

  it 'should not accept int for dsc_uninstallwithforce' do
    expect{dsc_xsqlserverreplication[:dsc_uninstallwithforce] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_uninstallwithforce' do
    expect{dsc_xsqlserverreplication[:dsc_uninstallwithforce] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverreplication)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverreplication)
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
        dsc_xsqlserverreplication.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlserverreplication[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverreplication)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlserverreplication[:ensure]).to eq(:present)
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
        dsc_xsqlserverreplication.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlserverreplication[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverreplication)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlserverreplication[:ensure]).to eq(:absent)
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
