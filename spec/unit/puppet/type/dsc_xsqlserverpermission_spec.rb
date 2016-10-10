#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverpermission) do

  let :dsc_xsqlserverpermission do
    Puppet::Type.type(:dsc_xsqlserverpermission).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverpermission).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_nodename => 'foo',
      :dsc_ensure => 'Present',
      :dsc_principal => 'foo',
      :dsc_permission => 'AlterAnyAvailabilityGroup',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverpermission.to_s).to eq("Dsc_xsqlserverpermission[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlserverpermission[:ensure]).to eq :present
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverpermission[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverpermission).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverpermission[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverpermission[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverpermission[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverpermission[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_nodename' do
    expect{dsc_xsqlserverpermission[:dsc_nodename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_nodename' do
    expect{dsc_xsqlserverpermission[:dsc_nodename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_nodename' do
    expect{dsc_xsqlserverpermission[:dsc_nodename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_nodename' do
    expect{dsc_xsqlserverpermission[:dsc_nodename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlserverpermission[:dsc_ensure] = 'Present'
    expect(dsc_xsqlserverpermission[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlserverpermission[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverpermission[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverpermission[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverpermission[:ensure]).to eq(dsc_xsqlserverpermission[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlserverpermission[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlserverpermission[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlserverpermission[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverpermission[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverpermission[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverpermission[:ensure]).to eq(dsc_xsqlserverpermission[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverpermission[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlserverpermission[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlserverpermission[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlserverpermission[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlserverpermission[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_principal' do
    expect{dsc_xsqlserverpermission[:dsc_principal] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_principal' do
    expect{dsc_xsqlserverpermission[:dsc_principal] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_principal' do
    expect{dsc_xsqlserverpermission[:dsc_principal] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_principal' do
    expect{dsc_xsqlserverpermission[:dsc_principal] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_permission predefined value AlterAnyAvailabilityGroup' do
    dsc_xsqlserverpermission[:dsc_permission] = 'AlterAnyAvailabilityGroup'
    expect(dsc_xsqlserverpermission[:dsc_permission]).to eq(['AlterAnyAvailabilityGroup'])
  end

  it 'should accept dsc_permission predefined value alteranyavailabilitygroup' do
    dsc_xsqlserverpermission[:dsc_permission] = 'alteranyavailabilitygroup'
    expect(dsc_xsqlserverpermission[:dsc_permission]).to eq(['alteranyavailabilitygroup'])
  end

  it 'should accept dsc_permission predefined value ViewServerState' do
    dsc_xsqlserverpermission[:dsc_permission] = 'ViewServerState'
    expect(dsc_xsqlserverpermission[:dsc_permission]).to eq(['ViewServerState'])
  end

  it 'should accept dsc_permission predefined value viewserverstate' do
    dsc_xsqlserverpermission[:dsc_permission] = 'viewserverstate'
    expect(dsc_xsqlserverpermission[:dsc_permission]).to eq(['viewserverstate'])
  end

  it 'should accept dsc_permission predefined value AlterAnyEndPoint' do
    dsc_xsqlserverpermission[:dsc_permission] = 'AlterAnyEndPoint'
    expect(dsc_xsqlserverpermission[:dsc_permission]).to eq(['AlterAnyEndPoint'])
  end

  it 'should accept dsc_permission predefined value alteranyendpoint' do
    dsc_xsqlserverpermission[:dsc_permission] = 'alteranyendpoint'
    expect(dsc_xsqlserverpermission[:dsc_permission]).to eq(['alteranyendpoint'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverpermission[:dsc_permission] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_permission' do
    dsc_xsqlserverpermission[:dsc_permission] = ["AlterAnyAvailabilityGroup", "ViewServerState", "AlterAnyEndPoint"]
    expect(dsc_xsqlserverpermission[:dsc_permission]).to eq(["AlterAnyAvailabilityGroup", "ViewServerState", "AlterAnyEndPoint"])
  end

  it 'should not accept boolean for dsc_permission' do
    expect{dsc_xsqlserverpermission[:dsc_permission] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_permission' do
    expect{dsc_xsqlserverpermission[:dsc_permission] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_permission' do
    expect{dsc_xsqlserverpermission[:dsc_permission] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverpermission)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverpermission)
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
        dsc_xsqlserverpermission.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlserverpermission[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverpermission)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlserverpermission[:ensure]).to eq(:present)
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
        dsc_xsqlserverpermission.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlserverpermission[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverpermission)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlserverpermission[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
