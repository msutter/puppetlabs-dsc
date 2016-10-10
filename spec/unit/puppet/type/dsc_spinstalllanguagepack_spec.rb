#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spinstalllanguagepack) do

  let :dsc_spinstalllanguagepack do
    Puppet::Type.type(:dsc_spinstalllanguagepack).new(
      :name     => 'foo',
      :dsc_binarydir => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spinstalllanguagepack).new(
      :name     => 'foo',
      :dsc_binarydir => 'foo',
      :dsc_binaryinstalldays => 'mon',
      :dsc_binaryinstalltime => 'foo',
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spinstalllanguagepack.to_s).to eq("Dsc_spinstalllanguagepack[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spinstalllanguagepack[:ensure]).to eq :present
  end

  it 'should require that dsc_binarydir is specified' do
    #dsc_spinstalllanguagepack[:dsc_binarydir]
    expect { Puppet::Type.type(:dsc_spinstalllanguagepack).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_binarydir is a required attribute/)
  end

  it 'should not accept array for dsc_binarydir' do
    expect{dsc_spinstalllanguagepack[:dsc_binarydir] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_binarydir' do
    expect{dsc_spinstalllanguagepack[:dsc_binarydir] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_binarydir' do
    expect{dsc_spinstalllanguagepack[:dsc_binarydir] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_binarydir' do
    expect{dsc_spinstalllanguagepack[:dsc_binarydir] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_binaryinstalldays predefined value mon' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'mon'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['mon'])
  end

  it 'should accept dsc_binaryinstalldays predefined value mon' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'mon'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['mon'])
  end

  it 'should accept dsc_binaryinstalldays predefined value tue' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'tue'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['tue'])
  end

  it 'should accept dsc_binaryinstalldays predefined value tue' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'tue'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['tue'])
  end

  it 'should accept dsc_binaryinstalldays predefined value wed' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'wed'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['wed'])
  end

  it 'should accept dsc_binaryinstalldays predefined value wed' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'wed'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['wed'])
  end

  it 'should accept dsc_binaryinstalldays predefined value thu' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'thu'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['thu'])
  end

  it 'should accept dsc_binaryinstalldays predefined value thu' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'thu'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['thu'])
  end

  it 'should accept dsc_binaryinstalldays predefined value fri' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'fri'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['fri'])
  end

  it 'should accept dsc_binaryinstalldays predefined value fri' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'fri'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['fri'])
  end

  it 'should accept dsc_binaryinstalldays predefined value sat' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'sat'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['sat'])
  end

  it 'should accept dsc_binaryinstalldays predefined value sat' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'sat'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['sat'])
  end

  it 'should accept dsc_binaryinstalldays predefined value sun' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'sun'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['sun'])
  end

  it 'should accept dsc_binaryinstalldays predefined value sun' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'sun'
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(['sun'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_binaryinstalldays' do
    dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]
    expect(dsc_spinstalllanguagepack[:dsc_binaryinstalldays]).to eq(["mon", "tue", "wed", "thu", "fri", "sat", "sun"])
  end

  it 'should not accept boolean for dsc_binaryinstalldays' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_binaryinstalldays' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_binaryinstalldays' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalldays] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_binaryinstalltime' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalltime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_binaryinstalltime' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalltime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_binaryinstalltime' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalltime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_binaryinstalltime' do
    expect{dsc_spinstalllanguagepack[:dsc_binaryinstalltime] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spinstalllanguagepack[:dsc_ensure] = 'Present'
    expect(dsc_spinstalllanguagepack[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spinstalllanguagepack[:dsc_ensure] = 'present'
    expect(dsc_spinstalllanguagepack[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spinstalllanguagepack[:dsc_ensure] = 'present'
    expect(dsc_spinstalllanguagepack[:ensure]).to eq(dsc_spinstalllanguagepack[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spinstalllanguagepack[:dsc_ensure] = 'Absent'
    expect(dsc_spinstalllanguagepack[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spinstalllanguagepack[:dsc_ensure] = 'absent'
    expect(dsc_spinstalllanguagepack[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spinstalllanguagepack[:dsc_ensure] = 'absent'
    expect(dsc_spinstalllanguagepack[:ensure]).to eq(dsc_spinstalllanguagepack[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spinstalllanguagepack[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spinstalllanguagepack[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spinstalllanguagepack[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spinstalllanguagepack[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spinstalllanguagepack[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spinstalllanguagepack[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spinstalllanguagepack[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spinstalllanguagepack[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spinstalllanguagepack[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spinstalllanguagepack[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spinstalllanguagepack)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spinstalllanguagepack)
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
        dsc_spinstalllanguagepack.original_parameters[:dsc_ensure] = 'present'
        dsc_spinstalllanguagepack[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spinstalllanguagepack)
      end

      it "should update :ensure to :present" do
        expect(dsc_spinstalllanguagepack[:ensure]).to eq(:present)
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
        dsc_spinstalllanguagepack.original_parameters[:dsc_ensure] = 'absent'
        dsc_spinstalllanguagepack[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spinstalllanguagepack)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spinstalllanguagepack[:ensure]).to eq(:absent)
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
