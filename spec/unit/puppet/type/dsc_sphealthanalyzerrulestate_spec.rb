#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_sphealthanalyzerrulestate) do

  let :dsc_sphealthanalyzerrulestate do
    Puppet::Type.type(:dsc_sphealthanalyzerrulestate).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_sphealthanalyzerrulestate).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_enabled => true,
      :dsc_rulescope => 'All Servers',
      :dsc_schedule => 'Hourly',
      :dsc_fixautomatically => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_sphealthanalyzerrulestate.to_s).to eq("Dsc_sphealthanalyzerrulestate[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_sphealthanalyzerrulestate[:dsc_name]
    expect { Puppet::Type.type(:dsc_sphealthanalyzerrulestate).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_sphealthanalyzerrulestate[:dsc_enabled] = true
    expect(dsc_sphealthanalyzerrulestate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_sphealthanalyzerrulestate[:dsc_enabled] = 'true'
    expect(dsc_sphealthanalyzerrulestate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_sphealthanalyzerrulestate[:dsc_enabled] = 'false'
    expect(dsc_sphealthanalyzerrulestate[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_sphealthanalyzerrulestate[:dsc_enabled] = 'True'
    expect(dsc_sphealthanalyzerrulestate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_sphealthanalyzerrulestate[:dsc_enabled] = 'False'
    expect(dsc_sphealthanalyzerrulestate[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_sphealthanalyzerrulestate[:dsc_enabled] = :true
    expect(dsc_sphealthanalyzerrulestate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_sphealthanalyzerrulestate[:dsc_enabled] = :false
    expect(dsc_sphealthanalyzerrulestate[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_rulescope predefined value All Servers' do
    dsc_sphealthanalyzerrulestate[:dsc_rulescope] = 'All Servers'
    expect(dsc_sphealthanalyzerrulestate[:dsc_rulescope]).to eq('All Servers')
  end

  it 'should accept dsc_rulescope predefined value all servers' do
    dsc_sphealthanalyzerrulestate[:dsc_rulescope] = 'all servers'
    expect(dsc_sphealthanalyzerrulestate[:dsc_rulescope]).to eq('all servers')
  end

  it 'should accept dsc_rulescope predefined value Any Server' do
    dsc_sphealthanalyzerrulestate[:dsc_rulescope] = 'Any Server'
    expect(dsc_sphealthanalyzerrulestate[:dsc_rulescope]).to eq('Any Server')
  end

  it 'should accept dsc_rulescope predefined value any server' do
    dsc_sphealthanalyzerrulestate[:dsc_rulescope] = 'any server'
    expect(dsc_sphealthanalyzerrulestate[:dsc_rulescope]).to eq('any server')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_rulescope] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rulescope' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_rulescope] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rulescope' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_rulescope] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rulescope' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_rulescope] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rulescope' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_rulescope] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_schedule predefined value Hourly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'Hourly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('Hourly')
  end

  it 'should accept dsc_schedule predefined value hourly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'hourly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('hourly')
  end

  it 'should accept dsc_schedule predefined value Daily' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'Daily'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('Daily')
  end

  it 'should accept dsc_schedule predefined value daily' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'daily'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('daily')
  end

  it 'should accept dsc_schedule predefined value Weekly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'Weekly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('Weekly')
  end

  it 'should accept dsc_schedule predefined value weekly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'weekly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('weekly')
  end

  it 'should accept dsc_schedule predefined value Monthly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'Monthly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('Monthly')
  end

  it 'should accept dsc_schedule predefined value monthly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'monthly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('monthly')
  end

  it 'should accept dsc_schedule predefined value OnDemandOnly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'OnDemandOnly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('OnDemandOnly')
  end

  it 'should accept dsc_schedule predefined value ondemandonly' do
    dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'ondemandonly'
    expect(dsc_sphealthanalyzerrulestate[:dsc_schedule]).to eq('ondemandonly')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_schedule] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_schedule' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_schedule] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_schedule' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_schedule] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_schedule' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_schedule] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_schedule' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_schedule] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fixautomatically' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_fixautomatically' do
    dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = true
    expect(dsc_sphealthanalyzerrulestate[:dsc_fixautomatically]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_fixautomatically" do
    dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = 'true'
    expect(dsc_sphealthanalyzerrulestate[:dsc_fixautomatically]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_fixautomatically" do
    dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = 'false'
    expect(dsc_sphealthanalyzerrulestate[:dsc_fixautomatically]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_fixautomatically" do
    dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = 'True'
    expect(dsc_sphealthanalyzerrulestate[:dsc_fixautomatically]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_fixautomatically" do
    dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = 'False'
    expect(dsc_sphealthanalyzerrulestate[:dsc_fixautomatically]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_fixautomatically" do
    dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = :true
    expect(dsc_sphealthanalyzerrulestate[:dsc_fixautomatically]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_fixautomatically" do
    dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = :false
    expect(dsc_sphealthanalyzerrulestate[:dsc_fixautomatically]).to eq(false)
  end

  it 'should not accept int for dsc_fixautomatically' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fixautomatically' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_fixautomatically] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_sphealthanalyzerrulestate[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_sphealthanalyzerrulestate[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_sphealthanalyzerrulestate)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_sphealthanalyzerrulestate)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
