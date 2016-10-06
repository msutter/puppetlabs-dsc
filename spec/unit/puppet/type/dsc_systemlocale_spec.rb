#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_systemlocale) do

  let :dsc_systemlocale do
    Puppet::Type.type(:dsc_systemlocale).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_systemlocale).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
      :dsc_systemlocale => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_systemlocale.to_s).to eq("Dsc_systemlocale[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_systemlocale[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_systemlocale).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_systemlocale[:dsc_issingleinstance] = 'Yes'
    expect(dsc_systemlocale[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_systemlocale[:dsc_issingleinstance] = 'yes'
    expect(dsc_systemlocale[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_systemlocale[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_systemlocale[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_systemlocale[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_systemlocale[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_systemlocale[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_systemlocale' do
    expect{dsc_systemlocale[:dsc_systemlocale] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_systemlocale' do
    expect{dsc_systemlocale[:dsc_systemlocale] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_systemlocale' do
    expect{dsc_systemlocale[:dsc_systemlocale] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_systemlocale' do
    expect{dsc_systemlocale[:dsc_systemlocale] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_systemlocale)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_systemlocale)
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
