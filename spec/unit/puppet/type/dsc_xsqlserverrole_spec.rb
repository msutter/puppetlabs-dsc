#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverrole) do

  let :dsc_xsqlserverrole do
    Puppet::Type.type(:dsc_xsqlserverrole).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_sqlinstancename => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverrole).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_ensure => 'Present',
      :dsc_serverrole => 'bulkadmin',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstancename => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverrole.to_s).to eq("Dsc_xsqlserverrole[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlserverrole[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xsqlserverrole[:dsc_name]
    expect { Puppet::Type.type(:dsc_xsqlserverrole).new(
      :name     => 'foo',
      :dsc_sqlinstancename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsqlserverrole[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsqlserverrole[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsqlserverrole[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsqlserverrole[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlserverrole[:dsc_ensure] = 'Present'
    expect(dsc_xsqlserverrole[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlserverrole[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverrole[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverrole[:dsc_ensure] = 'present'
    expect(dsc_xsqlserverrole[:ensure]).to eq(dsc_xsqlserverrole[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlserverrole[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlserverrole[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlserverrole[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverrole[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlserverrole[:dsc_ensure] = 'absent'
    expect(dsc_xsqlserverrole[:ensure]).to eq(dsc_xsqlserverrole[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverrole[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlserverrole[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlserverrole[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlserverrole[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlserverrole[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_serverrole predefined value bulkadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'bulkadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['bulkadmin'])
  end

  it 'should accept dsc_serverrole predefined value bulkadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'bulkadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['bulkadmin'])
  end

  it 'should accept dsc_serverrole predefined value dbcreator' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'dbcreator'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['dbcreator'])
  end

  it 'should accept dsc_serverrole predefined value dbcreator' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'dbcreator'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['dbcreator'])
  end

  it 'should accept dsc_serverrole predefined value diskadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'diskadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['diskadmin'])
  end

  it 'should accept dsc_serverrole predefined value diskadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'diskadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['diskadmin'])
  end

  it 'should accept dsc_serverrole predefined value processadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'processadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['processadmin'])
  end

  it 'should accept dsc_serverrole predefined value processadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'processadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['processadmin'])
  end

  it 'should accept dsc_serverrole predefined value public' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'public'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['public'])
  end

  it 'should accept dsc_serverrole predefined value public' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'public'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['public'])
  end

  it 'should accept dsc_serverrole predefined value securityadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'securityadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['securityadmin'])
  end

  it 'should accept dsc_serverrole predefined value securityadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'securityadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['securityadmin'])
  end

  it 'should accept dsc_serverrole predefined value serveradmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'serveradmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['serveradmin'])
  end

  it 'should accept dsc_serverrole predefined value serveradmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'serveradmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['serveradmin'])
  end

  it 'should accept dsc_serverrole predefined value setupadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'setupadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['setupadmin'])
  end

  it 'should accept dsc_serverrole predefined value setupadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'setupadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['setupadmin'])
  end

  it 'should accept dsc_serverrole predefined value sysadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'sysadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['sysadmin'])
  end

  it 'should accept dsc_serverrole predefined value sysadmin' do
    dsc_xsqlserverrole[:dsc_serverrole] = 'sysadmin'
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(['sysadmin'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverrole[:dsc_serverrole] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_serverrole' do
    dsc_xsqlserverrole[:dsc_serverrole] = ["bulkadmin", "dbcreator", "diskadmin", "processadmin", "public", "securityadmin", "serveradmin", "setupadmin", "sysadmin"]
    expect(dsc_xsqlserverrole[:dsc_serverrole]).to eq(["bulkadmin", "dbcreator", "diskadmin", "processadmin", "public", "securityadmin", "serveradmin", "setupadmin", "sysadmin"])
  end

  it 'should not accept boolean for dsc_serverrole' do
    expect{dsc_xsqlserverrole[:dsc_serverrole] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serverrole' do
    expect{dsc_xsqlserverrole[:dsc_serverrole] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serverrole' do
    expect{dsc_xsqlserverrole[:dsc_serverrole] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xsqlserverrole[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xsqlserverrole[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xsqlserverrole[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xsqlserverrole[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_sqlinstancename is specified' do
    #dsc_xsqlserverrole[:dsc_sqlinstancename]
    expect { Puppet::Type.type(:dsc_xsqlserverrole).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_sqlinstancename is a required attribute/)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xsqlserverrole[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xsqlserverrole[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xsqlserverrole[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xsqlserverrole[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverrole)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverrole)
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
        dsc_xsqlserverrole.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlserverrole[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverrole)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlserverrole[:ensure]).to eq(:present)
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
        dsc_xsqlserverrole.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlserverrole[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlserverrole)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlserverrole[:ensure]).to eq(:absent)
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
