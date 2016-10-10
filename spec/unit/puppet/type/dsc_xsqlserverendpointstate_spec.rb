#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverendpointstate) do

  let :dsc_xsqlserverendpointstate do
    Puppet::Type.type(:dsc_xsqlserverendpointstate).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverendpointstate).new(
      :name     => 'foo',
      :dsc_instancename => 'foo',
      :dsc_nodename => 'foo',
      :dsc_name => 'foo',
      :dsc_state => 'Started',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverendpointstate.to_s).to eq("Dsc_xsqlserverendpointstate[foo]")
  end

  it 'should require that dsc_instancename is specified' do
    #dsc_xsqlserverendpointstate[:dsc_instancename]
    expect { Puppet::Type.type(:dsc_xsqlserverendpointstate).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_instancename is a required attribute/)
  end

  it 'should not accept array for dsc_instancename' do
    expect{dsc_xsqlserverendpointstate[:dsc_instancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancename' do
    expect{dsc_xsqlserverendpointstate[:dsc_instancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancename' do
    expect{dsc_xsqlserverendpointstate[:dsc_instancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancename' do
    expect{dsc_xsqlserverendpointstate[:dsc_instancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_nodename' do
    expect{dsc_xsqlserverendpointstate[:dsc_nodename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_nodename' do
    expect{dsc_xsqlserverendpointstate[:dsc_nodename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_nodename' do
    expect{dsc_xsqlserverendpointstate[:dsc_nodename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_nodename' do
    expect{dsc_xsqlserverendpointstate[:dsc_nodename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsqlserverendpointstate[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsqlserverendpointstate[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsqlserverendpointstate[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsqlserverendpointstate[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Started' do
    dsc_xsqlserverendpointstate[:dsc_state] = 'Started'
    expect(dsc_xsqlserverendpointstate[:dsc_state]).to eq('Started')
  end

  it 'should accept dsc_state predefined value started' do
    dsc_xsqlserverendpointstate[:dsc_state] = 'started'
    expect(dsc_xsqlserverendpointstate[:dsc_state]).to eq('started')
  end

  it 'should accept dsc_state predefined value Stopped' do
    dsc_xsqlserverendpointstate[:dsc_state] = 'Stopped'
    expect(dsc_xsqlserverendpointstate[:dsc_state]).to eq('Stopped')
  end

  it 'should accept dsc_state predefined value stopped' do
    dsc_xsqlserverendpointstate[:dsc_state] = 'stopped'
    expect(dsc_xsqlserverendpointstate[:dsc_state]).to eq('stopped')
  end

  it 'should accept dsc_state predefined value Disabled' do
    dsc_xsqlserverendpointstate[:dsc_state] = 'Disabled'
    expect(dsc_xsqlserverendpointstate[:dsc_state]).to eq('Disabled')
  end

  it 'should accept dsc_state predefined value disabled' do
    dsc_xsqlserverendpointstate[:dsc_state] = 'disabled'
    expect(dsc_xsqlserverendpointstate[:dsc_state]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlserverendpointstate[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xsqlserverendpointstate[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xsqlserverendpointstate[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xsqlserverendpointstate[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xsqlserverendpointstate[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverendpointstate)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverendpointstate)
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
