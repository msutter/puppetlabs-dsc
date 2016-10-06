#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebappblockedfiletypes) do

  let :dsc_spwebappblockedfiletypes do
    Puppet::Type.type(:dsc_spwebappblockedfiletypes).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebappblockedfiletypes).new(
      :name     => 'foo',
      :dsc_url => 'foo',
      :dsc_blocked => ["foo", "bar", "spec"],
      :dsc_ensureblocked => ["foo", "bar", "spec"],
      :dsc_ensureallowed => ["foo", "bar", "spec"],
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebappblockedfiletypes.to_s).to eq("Dsc_spwebappblockedfiletypes[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_spwebappblockedfiletypes[:dsc_url]
    expect { Puppet::Type.type(:dsc_spwebappblockedfiletypes).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_spwebappblockedfiletypes[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_spwebappblockedfiletypes[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_spwebappblockedfiletypes[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_spwebappblockedfiletypes[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_blocked' do
    dsc_spwebappblockedfiletypes[:dsc_blocked] = ["foo", "bar", "spec"]
    expect(dsc_spwebappblockedfiletypes[:dsc_blocked]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_blocked' do
    expect{dsc_spwebappblockedfiletypes[:dsc_blocked] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_blocked' do
    expect{dsc_spwebappblockedfiletypes[:dsc_blocked] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_blocked' do
    expect{dsc_spwebappblockedfiletypes[:dsc_blocked] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_ensureblocked' do
    dsc_spwebappblockedfiletypes[:dsc_ensureblocked] = ["foo", "bar", "spec"]
    expect(dsc_spwebappblockedfiletypes[:dsc_ensureblocked]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_ensureblocked' do
    expect{dsc_spwebappblockedfiletypes[:dsc_ensureblocked] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensureblocked' do
    expect{dsc_spwebappblockedfiletypes[:dsc_ensureblocked] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensureblocked' do
    expect{dsc_spwebappblockedfiletypes[:dsc_ensureblocked] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_ensureallowed' do
    dsc_spwebappblockedfiletypes[:dsc_ensureallowed] = ["foo", "bar", "spec"]
    expect(dsc_spwebappblockedfiletypes[:dsc_ensureallowed]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_ensureallowed' do
    expect{dsc_spwebappblockedfiletypes[:dsc_ensureallowed] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensureallowed' do
    expect{dsc_spwebappblockedfiletypes[:dsc_ensureallowed] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensureallowed' do
    expect{dsc_spwebappblockedfiletypes[:dsc_ensureallowed] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebappblockedfiletypes[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebappblockedfiletypes[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebappblockedfiletypes[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebappblockedfiletypes[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spwebappblockedfiletypes[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebappblockedfiletypes)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebappblockedfiletypes)
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
