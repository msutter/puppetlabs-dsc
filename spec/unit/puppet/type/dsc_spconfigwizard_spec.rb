#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spconfigwizard) do

  let :dsc_spconfigwizard do
    Puppet::Type.type(:dsc_spconfigwizard).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spconfigwizard).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_databaseupgradedays => 'mon',
      :dsc_databaseupgradetime => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spconfigwizard.to_s).to eq("Dsc_spconfigwizard[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spconfigwizard[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_spconfigwizard[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_spconfigwizard).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spconfigwizard[:dsc_ensure] = 'Present'
    expect(dsc_spconfigwizard[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spconfigwizard[:dsc_ensure] = 'present'
    expect(dsc_spconfigwizard[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spconfigwizard[:dsc_ensure] = 'present'
    expect(dsc_spconfigwizard[:ensure]).to eq(dsc_spconfigwizard[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spconfigwizard[:dsc_ensure] = 'Absent'
    expect(dsc_spconfigwizard[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spconfigwizard[:dsc_ensure] = 'absent'
    expect(dsc_spconfigwizard[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spconfigwizard[:dsc_ensure] = 'absent'
    expect(dsc_spconfigwizard[:ensure]).to eq(dsc_spconfigwizard[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spconfigwizard[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spconfigwizard[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spconfigwizard[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spconfigwizard[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spconfigwizard[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_databaseupgradedays predefined value mon' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'mon'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['mon'])
  end

  it 'should accept dsc_databaseupgradedays predefined value mon' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'mon'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['mon'])
  end

  it 'should accept dsc_databaseupgradedays predefined value tue' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'tue'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['tue'])
  end

  it 'should accept dsc_databaseupgradedays predefined value tue' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'tue'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['tue'])
  end

  it 'should accept dsc_databaseupgradedays predefined value wed' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'wed'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['wed'])
  end

  it 'should accept dsc_databaseupgradedays predefined value wed' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'wed'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['wed'])
  end

  it 'should accept dsc_databaseupgradedays predefined value thu' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'thu'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['thu'])
  end

  it 'should accept dsc_databaseupgradedays predefined value thu' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'thu'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['thu'])
  end

  it 'should accept dsc_databaseupgradedays predefined value fri' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'fri'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['fri'])
  end

  it 'should accept dsc_databaseupgradedays predefined value fri' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'fri'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['fri'])
  end

  it 'should accept dsc_databaseupgradedays predefined value sat' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'sat'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['sat'])
  end

  it 'should accept dsc_databaseupgradedays predefined value sat' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'sat'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['sat'])
  end

  it 'should accept dsc_databaseupgradedays predefined value sun' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'sun'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['sun'])
  end

  it 'should accept dsc_databaseupgradedays predefined value sun' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = 'sun'
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(['sun'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradedays] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_databaseupgradedays' do
    dsc_spconfigwizard[:dsc_databaseupgradedays] = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]
    expect(dsc_spconfigwizard[:dsc_databaseupgradedays]).to eq(["mon", "tue", "wed", "thu", "fri", "sat", "sun"])
  end

  it 'should not accept boolean for dsc_databaseupgradedays' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradedays] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseupgradedays' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradedays] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseupgradedays' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradedays] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseupgradetime' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradetime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseupgradetime' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradetime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseupgradetime' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradetime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseupgradetime' do
    expect{dsc_spconfigwizard[:dsc_databaseupgradetime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spconfigwizard[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spconfigwizard[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spconfigwizard[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spconfigwizard[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spconfigwizard[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spconfigwizard)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spconfigwizard)
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
        dsc_spconfigwizard.original_parameters[:dsc_ensure] = 'present'
        dsc_spconfigwizard[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spconfigwizard)
      end

      it "should update :ensure to :present" do
        expect(dsc_spconfigwizard[:ensure]).to eq(:present)
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
        dsc_spconfigwizard.original_parameters[:dsc_ensure] = 'absent'
        dsc_spconfigwizard[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spconfigwizard)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spconfigwizard[:ensure]).to eq(:absent)
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
