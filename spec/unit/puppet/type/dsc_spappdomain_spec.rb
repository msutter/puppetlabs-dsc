#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spappdomain) do

  let :dsc_spappdomain do
    Puppet::Type.type(:dsc_spappdomain).new(
      :name     => 'foo',
      :dsc_appdomain => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spappdomain).new(
      :name     => 'foo',
      :dsc_appdomain => 'foo',
      :dsc_prefix => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spappdomain.to_s).to eq("Dsc_spappdomain[foo]")
  end

  it 'should require that dsc_appdomain is specified' do
    #dsc_spappdomain[:dsc_appdomain]
    expect { Puppet::Type.type(:dsc_spappdomain).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_appdomain is a required attribute/)
  end

  it 'should not accept array for dsc_appdomain' do
    expect{dsc_spappdomain[:dsc_appdomain] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_appdomain' do
    expect{dsc_spappdomain[:dsc_appdomain] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_appdomain' do
    expect{dsc_spappdomain[:dsc_appdomain] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_appdomain' do
    expect{dsc_spappdomain[:dsc_appdomain] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_prefix' do
    expect{dsc_spappdomain[:dsc_prefix] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_prefix' do
    expect{dsc_spappdomain[:dsc_prefix] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_prefix' do
    expect{dsc_spappdomain[:dsc_prefix] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_prefix' do
    expect{dsc_spappdomain[:dsc_prefix] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spappdomain[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spappdomain[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spappdomain[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spappdomain[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spappdomain[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spappdomain)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spappdomain)
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
