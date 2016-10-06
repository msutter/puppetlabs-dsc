#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spinstallprereqs) do

  let :dsc_spinstallprereqs do
    Puppet::Type.type(:dsc_spinstallprereqs).new(
      :name     => 'foo',
      :dsc_installerpath => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spinstallprereqs).new(
      :name     => 'foo',
      :dsc_installerpath => 'foo',
      :dsc_onlinemode => true,
      :dsc_sxspath => 'foo',
      :dsc_sqlncli => 'foo',
      :dsc_powershell => 'foo',
      :dsc_netfx => 'foo',
      :dsc_idfx => 'foo',
      :dsc_sync => 'foo',
      :dsc_appfabric => 'foo',
      :dsc_idfx11 => 'foo',
      :dsc_msipcclient => 'foo',
      :dsc_wcfdataservices => 'foo',
      :dsc_kb2671763 => 'foo',
      :dsc_wcfdataservices56 => 'foo',
      :dsc_msvcrt11 => 'foo',
      :dsc_msvcrt14 => 'foo',
      :dsc_kb3092423 => 'foo',
      :dsc_odbc => 'foo',
      :dsc_dotnetfx => 'foo',
      :dsc_ensure => 'Present',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spinstallprereqs.to_s).to eq("Dsc_spinstallprereqs[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spinstallprereqs[:ensure]).to eq :present
  end

  it 'should require that dsc_installerpath is specified' do
    #dsc_spinstallprereqs[:dsc_installerpath]
    expect { Puppet::Type.type(:dsc_spinstallprereqs).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_installerpath is a required attribute/)
  end

  it 'should not accept array for dsc_installerpath' do
    expect{dsc_spinstallprereqs[:dsc_installerpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installerpath' do
    expect{dsc_spinstallprereqs[:dsc_installerpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installerpath' do
    expect{dsc_spinstallprereqs[:dsc_installerpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installerpath' do
    expect{dsc_spinstallprereqs[:dsc_installerpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_onlinemode' do
    expect{dsc_spinstallprereqs[:dsc_onlinemode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_onlinemode' do
    dsc_spinstallprereqs[:dsc_onlinemode] = true
    expect(dsc_spinstallprereqs[:dsc_onlinemode]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_onlinemode" do
    dsc_spinstallprereqs[:dsc_onlinemode] = 'true'
    expect(dsc_spinstallprereqs[:dsc_onlinemode]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_onlinemode" do
    dsc_spinstallprereqs[:dsc_onlinemode] = 'false'
    expect(dsc_spinstallprereqs[:dsc_onlinemode]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_onlinemode" do
    dsc_spinstallprereqs[:dsc_onlinemode] = 'True'
    expect(dsc_spinstallprereqs[:dsc_onlinemode]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_onlinemode" do
    dsc_spinstallprereqs[:dsc_onlinemode] = 'False'
    expect(dsc_spinstallprereqs[:dsc_onlinemode]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_onlinemode" do
    dsc_spinstallprereqs[:dsc_onlinemode] = :true
    expect(dsc_spinstallprereqs[:dsc_onlinemode]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_onlinemode" do
    dsc_spinstallprereqs[:dsc_onlinemode] = :false
    expect(dsc_spinstallprereqs[:dsc_onlinemode]).to eq(false)
  end

  it 'should not accept int for dsc_onlinemode' do
    expect{dsc_spinstallprereqs[:dsc_onlinemode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_onlinemode' do
    expect{dsc_spinstallprereqs[:dsc_onlinemode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sxspath' do
    expect{dsc_spinstallprereqs[:dsc_sxspath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sxspath' do
    expect{dsc_spinstallprereqs[:dsc_sxspath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sxspath' do
    expect{dsc_spinstallprereqs[:dsc_sxspath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sxspath' do
    expect{dsc_spinstallprereqs[:dsc_sxspath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlncli' do
    expect{dsc_spinstallprereqs[:dsc_sqlncli] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlncli' do
    expect{dsc_spinstallprereqs[:dsc_sqlncli] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlncli' do
    expect{dsc_spinstallprereqs[:dsc_sqlncli] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlncli' do
    expect{dsc_spinstallprereqs[:dsc_sqlncli] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_powershell' do
    expect{dsc_spinstallprereqs[:dsc_powershell] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_powershell' do
    expect{dsc_spinstallprereqs[:dsc_powershell] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_powershell' do
    expect{dsc_spinstallprereqs[:dsc_powershell] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_powershell' do
    expect{dsc_spinstallprereqs[:dsc_powershell] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_netfx' do
    expect{dsc_spinstallprereqs[:dsc_netfx] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_netfx' do
    expect{dsc_spinstallprereqs[:dsc_netfx] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_netfx' do
    expect{dsc_spinstallprereqs[:dsc_netfx] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_netfx' do
    expect{dsc_spinstallprereqs[:dsc_netfx] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_idfx' do
    expect{dsc_spinstallprereqs[:dsc_idfx] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_idfx' do
    expect{dsc_spinstallprereqs[:dsc_idfx] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_idfx' do
    expect{dsc_spinstallprereqs[:dsc_idfx] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_idfx' do
    expect{dsc_spinstallprereqs[:dsc_idfx] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sync' do
    expect{dsc_spinstallprereqs[:dsc_sync] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sync' do
    expect{dsc_spinstallprereqs[:dsc_sync] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sync' do
    expect{dsc_spinstallprereqs[:dsc_sync] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sync' do
    expect{dsc_spinstallprereqs[:dsc_sync] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_appfabric' do
    expect{dsc_spinstallprereqs[:dsc_appfabric] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_appfabric' do
    expect{dsc_spinstallprereqs[:dsc_appfabric] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_appfabric' do
    expect{dsc_spinstallprereqs[:dsc_appfabric] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_appfabric' do
    expect{dsc_spinstallprereqs[:dsc_appfabric] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_idfx11' do
    expect{dsc_spinstallprereqs[:dsc_idfx11] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_idfx11' do
    expect{dsc_spinstallprereqs[:dsc_idfx11] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_idfx11' do
    expect{dsc_spinstallprereqs[:dsc_idfx11] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_idfx11' do
    expect{dsc_spinstallprereqs[:dsc_idfx11] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_msipcclient' do
    expect{dsc_spinstallprereqs[:dsc_msipcclient] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_msipcclient' do
    expect{dsc_spinstallprereqs[:dsc_msipcclient] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_msipcclient' do
    expect{dsc_spinstallprereqs[:dsc_msipcclient] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_msipcclient' do
    expect{dsc_spinstallprereqs[:dsc_msipcclient] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_wcfdataservices' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_wcfdataservices' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_wcfdataservices' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_wcfdataservices' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_kb2671763' do
    expect{dsc_spinstallprereqs[:dsc_kb2671763] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_kb2671763' do
    expect{dsc_spinstallprereqs[:dsc_kb2671763] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_kb2671763' do
    expect{dsc_spinstallprereqs[:dsc_kb2671763] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_kb2671763' do
    expect{dsc_spinstallprereqs[:dsc_kb2671763] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_wcfdataservices56' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices56] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_wcfdataservices56' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices56] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_wcfdataservices56' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices56] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_wcfdataservices56' do
    expect{dsc_spinstallprereqs[:dsc_wcfdataservices56] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_msvcrt11' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt11] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_msvcrt11' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt11] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_msvcrt11' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt11] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_msvcrt11' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt11] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_msvcrt14' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt14] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_msvcrt14' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt14] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_msvcrt14' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt14] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_msvcrt14' do
    expect{dsc_spinstallprereqs[:dsc_msvcrt14] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_kb3092423' do
    expect{dsc_spinstallprereqs[:dsc_kb3092423] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_kb3092423' do
    expect{dsc_spinstallprereqs[:dsc_kb3092423] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_kb3092423' do
    expect{dsc_spinstallprereqs[:dsc_kb3092423] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_kb3092423' do
    expect{dsc_spinstallprereqs[:dsc_kb3092423] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_odbc' do
    expect{dsc_spinstallprereqs[:dsc_odbc] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_odbc' do
    expect{dsc_spinstallprereqs[:dsc_odbc] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_odbc' do
    expect{dsc_spinstallprereqs[:dsc_odbc] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_odbc' do
    expect{dsc_spinstallprereqs[:dsc_odbc] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dotnetfx' do
    expect{dsc_spinstallprereqs[:dsc_dotnetfx] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dotnetfx' do
    expect{dsc_spinstallprereqs[:dsc_dotnetfx] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dotnetfx' do
    expect{dsc_spinstallprereqs[:dsc_dotnetfx] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dotnetfx' do
    expect{dsc_spinstallprereqs[:dsc_dotnetfx] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spinstallprereqs[:dsc_ensure] = 'Present'
    expect(dsc_spinstallprereqs[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spinstallprereqs[:dsc_ensure] = 'present'
    expect(dsc_spinstallprereqs[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spinstallprereqs[:dsc_ensure] = 'present'
    expect(dsc_spinstallprereqs[:ensure]).to eq(dsc_spinstallprereqs[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spinstallprereqs[:dsc_ensure] = 'Absent'
    expect(dsc_spinstallprereqs[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spinstallprereqs[:dsc_ensure] = 'absent'
    expect(dsc_spinstallprereqs[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spinstallprereqs[:dsc_ensure] = 'absent'
    expect(dsc_spinstallprereqs[:ensure]).to eq(dsc_spinstallprereqs[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spinstallprereqs[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spinstallprereqs[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spinstallprereqs[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spinstallprereqs[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spinstallprereqs[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spinstallprereqs)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spinstallprereqs)
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
        dsc_spinstallprereqs.original_parameters[:dsc_ensure] = 'present'
        dsc_spinstallprereqs[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spinstallprereqs)
      end

      it "should update :ensure to :present" do
        expect(dsc_spinstallprereqs[:ensure]).to eq(:present)
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
        dsc_spinstallprereqs.original_parameters[:dsc_ensure] = 'absent'
        dsc_spinstallprereqs[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spinstallprereqs)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spinstallprereqs[:ensure]).to eq(:absent)
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
