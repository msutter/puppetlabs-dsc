#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsmacredential) do

  let :dsc_xsmacredential do
    Puppet::Type.type(:dsc_xsmacredential).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsmacredential).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_description => 'foo',
      :dsc_webserviceendpoint => 'foo',
      :dsc_port => 32,
      :dsc_username => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsmacredential.to_s).to eq("Dsc_xsmacredential[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xsmacredential[:dsc_name]
    expect { Puppet::Type.type(:dsc_xsmacredential).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsmacredential[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsmacredential[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsmacredential[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsmacredential[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xsmacredential[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xsmacredential[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xsmacredential[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xsmacredential[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xsmacredential[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xsmacredential[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xsmacredential[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xsmacredential[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xsmacredential[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_webserviceendpoint' do
    expect{dsc_xsmacredential[:dsc_webserviceendpoint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webserviceendpoint' do
    expect{dsc_xsmacredential[:dsc_webserviceendpoint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webserviceendpoint' do
    expect{dsc_xsmacredential[:dsc_webserviceendpoint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webserviceendpoint' do
    expect{dsc_xsmacredential[:dsc_webserviceendpoint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_xsmacredential[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_xsmacredential[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_port' do
    dsc_xsmacredential[:dsc_port] = 32
    expect(dsc_xsmacredential[:dsc_port]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_port' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xsmacredential[:dsc_port] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xsmacredential[:dsc_port] = '16'
    expect(dsc_xsmacredential[:dsc_port]).to eq(16)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xsmacredential[:dsc_port] = '32'
    expect(dsc_xsmacredential[:dsc_port]).to eq(32)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_xsmacredential[:dsc_port] = '64'
    expect(dsc_xsmacredential[:dsc_port]).to eq(64)
  end

  it 'should not accept array for dsc_username' do
    expect{dsc_xsmacredential[:dsc_username] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_username' do
    expect{dsc_xsmacredential[:dsc_username] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_username' do
    expect{dsc_xsmacredential[:dsc_username] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_username' do
    expect{dsc_xsmacredential[:dsc_username] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsmacredential)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsmacredential)
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
