#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xclusterquorum) do

  let :dsc_xclusterquorum do
    Puppet::Type.type(:dsc_xclusterquorum).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xclusterquorum).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
      :dsc_type => 'NodeMajority',
      :dsc_resource => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xclusterquorum.to_s).to eq("Dsc_xclusterquorum[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_xclusterquorum[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_xclusterquorum).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_xclusterquorum[:dsc_issingleinstance] = 'Yes'
    expect(dsc_xclusterquorum[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_xclusterquorum[:dsc_issingleinstance] = 'yes'
    expect(dsc_xclusterquorum[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xclusterquorum[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_xclusterquorum[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_xclusterquorum[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_xclusterquorum[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_xclusterquorum[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_type predefined value NodeMajority' do
    dsc_xclusterquorum[:dsc_type] = 'NodeMajority'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('NodeMajority')
  end

  it 'should accept dsc_type predefined value nodemajority' do
    dsc_xclusterquorum[:dsc_type] = 'nodemajority'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('nodemajority')
  end

  it 'should accept dsc_type predefined value NodeAndDiskMajority' do
    dsc_xclusterquorum[:dsc_type] = 'NodeAndDiskMajority'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('NodeAndDiskMajority')
  end

  it 'should accept dsc_type predefined value nodeanddiskmajority' do
    dsc_xclusterquorum[:dsc_type] = 'nodeanddiskmajority'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('nodeanddiskmajority')
  end

  it 'should accept dsc_type predefined value NodeAndFileShareMajority' do
    dsc_xclusterquorum[:dsc_type] = 'NodeAndFileShareMajority'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('NodeAndFileShareMajority')
  end

  it 'should accept dsc_type predefined value nodeandfilesharemajority' do
    dsc_xclusterquorum[:dsc_type] = 'nodeandfilesharemajority'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('nodeandfilesharemajority')
  end

  it 'should accept dsc_type predefined value DiskOnly' do
    dsc_xclusterquorum[:dsc_type] = 'DiskOnly'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('DiskOnly')
  end

  it 'should accept dsc_type predefined value diskonly' do
    dsc_xclusterquorum[:dsc_type] = 'diskonly'
    expect(dsc_xclusterquorum[:dsc_type]).to eq('diskonly')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xclusterquorum[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xclusterquorum[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xclusterquorum[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xclusterquorum[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xclusterquorum[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_resource' do
    expect{dsc_xclusterquorum[:dsc_resource] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_resource' do
    expect{dsc_xclusterquorum[:dsc_resource] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_resource' do
    expect{dsc_xclusterquorum[:dsc_resource] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_resource' do
    expect{dsc_xclusterquorum[:dsc_resource] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xclusterquorum)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xclusterquorum)
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
