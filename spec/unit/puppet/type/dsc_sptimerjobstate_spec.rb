#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_sptimerjobstate) do

  let :dsc_sptimerjobstate do
    Puppet::Type.type(:dsc_sptimerjobstate).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_sptimerjobstate).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_webapplication => 'foo',
      :dsc_enabled => true,
      :dsc_schedule => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_sptimerjobstate.to_s).to eq("Dsc_sptimerjobstate[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_sptimerjobstate[:dsc_name]
    expect { Puppet::Type.type(:dsc_sptimerjobstate).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_sptimerjobstate[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_sptimerjobstate[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_sptimerjobstate[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_sptimerjobstate[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_webapplication' do
    expect{dsc_sptimerjobstate[:dsc_webapplication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webapplication' do
    expect{dsc_sptimerjobstate[:dsc_webapplication] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webapplication' do
    expect{dsc_sptimerjobstate[:dsc_webapplication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webapplication' do
    expect{dsc_sptimerjobstate[:dsc_webapplication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_sptimerjobstate[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_sptimerjobstate[:dsc_enabled] = true
    expect(dsc_sptimerjobstate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_sptimerjobstate[:dsc_enabled] = 'true'
    expect(dsc_sptimerjobstate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_sptimerjobstate[:dsc_enabled] = 'false'
    expect(dsc_sptimerjobstate[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_sptimerjobstate[:dsc_enabled] = 'True'
    expect(dsc_sptimerjobstate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_sptimerjobstate[:dsc_enabled] = 'False'
    expect(dsc_sptimerjobstate[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_sptimerjobstate[:dsc_enabled] = :true
    expect(dsc_sptimerjobstate[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_sptimerjobstate[:dsc_enabled] = :false
    expect(dsc_sptimerjobstate[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_sptimerjobstate[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_sptimerjobstate[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_schedule' do
    expect{dsc_sptimerjobstate[:dsc_schedule] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_schedule' do
    expect{dsc_sptimerjobstate[:dsc_schedule] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_schedule' do
    expect{dsc_sptimerjobstate[:dsc_schedule] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_schedule' do
    expect{dsc_sptimerjobstate[:dsc_schedule] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_sptimerjobstate[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_sptimerjobstate[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_sptimerjobstate[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_sptimerjobstate[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_sptimerjobstate[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_sptimerjobstate)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_sptimerjobstate)
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
