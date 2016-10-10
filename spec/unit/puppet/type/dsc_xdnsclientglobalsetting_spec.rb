#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsclientglobalsetting) do

  let :dsc_xdnsclientglobalsetting do
    Puppet::Type.type(:dsc_xdnsclientglobalsetting).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdnsclientglobalsetting).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
      :dsc_suffixsearchlist => ["foo", "bar", "spec"],
      :dsc_usedevolution => true,
      :dsc_devolutionlevel => 32,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdnsclientglobalsetting.to_s).to eq("Dsc_xdnsclientglobalsetting[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_xdnsclientglobalsetting[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_xdnsclientglobalsetting).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_xdnsclientglobalsetting[:dsc_issingleinstance] = 'Yes'
    expect(dsc_xdnsclientglobalsetting[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_xdnsclientglobalsetting[:dsc_issingleinstance] = 'yes'
    expect(dsc_xdnsclientglobalsetting[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsclientglobalsetting[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_xdnsclientglobalsetting[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_xdnsclientglobalsetting[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_xdnsclientglobalsetting[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_xdnsclientglobalsetting[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_suffixsearchlist' do
    dsc_xdnsclientglobalsetting[:dsc_suffixsearchlist] = ["foo", "bar", "spec"]
    expect(dsc_xdnsclientglobalsetting[:dsc_suffixsearchlist]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_suffixsearchlist' do
    expect{dsc_xdnsclientglobalsetting[:dsc_suffixsearchlist] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_suffixsearchlist' do
    expect{dsc_xdnsclientglobalsetting[:dsc_suffixsearchlist] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_suffixsearchlist' do
    expect{dsc_xdnsclientglobalsetting[:dsc_suffixsearchlist] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usedevolution' do
    expect{dsc_xdnsclientglobalsetting[:dsc_usedevolution] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usedevolution' do
    dsc_xdnsclientglobalsetting[:dsc_usedevolution] = true
    expect(dsc_xdnsclientglobalsetting[:dsc_usedevolution]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usedevolution" do
    dsc_xdnsclientglobalsetting[:dsc_usedevolution] = 'true'
    expect(dsc_xdnsclientglobalsetting[:dsc_usedevolution]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usedevolution" do
    dsc_xdnsclientglobalsetting[:dsc_usedevolution] = 'false'
    expect(dsc_xdnsclientglobalsetting[:dsc_usedevolution]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usedevolution" do
    dsc_xdnsclientglobalsetting[:dsc_usedevolution] = 'True'
    expect(dsc_xdnsclientglobalsetting[:dsc_usedevolution]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usedevolution" do
    dsc_xdnsclientglobalsetting[:dsc_usedevolution] = 'False'
    expect(dsc_xdnsclientglobalsetting[:dsc_usedevolution]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usedevolution" do
    dsc_xdnsclientglobalsetting[:dsc_usedevolution] = :true
    expect(dsc_xdnsclientglobalsetting[:dsc_usedevolution]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usedevolution" do
    dsc_xdnsclientglobalsetting[:dsc_usedevolution] = :false
    expect(dsc_xdnsclientglobalsetting[:dsc_usedevolution]).to eq(false)
  end

  it 'should not accept int for dsc_usedevolution' do
    expect{dsc_xdnsclientglobalsetting[:dsc_usedevolution] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usedevolution' do
    expect{dsc_xdnsclientglobalsetting[:dsc_usedevolution] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_devolutionlevel' do
    expect{dsc_xdnsclientglobalsetting[:dsc_devolutionlevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_devolutionlevel' do
    expect{dsc_xdnsclientglobalsetting[:dsc_devolutionlevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_devolutionlevel' do
    dsc_xdnsclientglobalsetting[:dsc_devolutionlevel] = 32
    expect(dsc_xdnsclientglobalsetting[:dsc_devolutionlevel]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_devolutionlevel' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xdnsclientglobalsetting[:dsc_devolutionlevel] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_devolutionlevel' do
    dsc_xdnsclientglobalsetting[:dsc_devolutionlevel] = '16'
    expect(dsc_xdnsclientglobalsetting[:dsc_devolutionlevel]).to eq(16)
  end

  it 'should accept string-like uint for dsc_devolutionlevel' do
    dsc_xdnsclientglobalsetting[:dsc_devolutionlevel] = '32'
    expect(dsc_xdnsclientglobalsetting[:dsc_devolutionlevel]).to eq(32)
  end

  it 'should accept string-like uint for dsc_devolutionlevel' do
    dsc_xdnsclientglobalsetting[:dsc_devolutionlevel] = '64'
    expect(dsc_xdnsclientglobalsetting[:dsc_devolutionlevel]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdnsclientglobalsetting)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdnsclientglobalsetting)
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

  end
end
