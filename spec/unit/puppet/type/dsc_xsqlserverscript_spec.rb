#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlserverscript) do

  let :dsc_xsqlserverscript do
    Puppet::Type.type(:dsc_xsqlserverscript).new(
      :name     => 'foo',
      :dsc_setfilepath => 'foo',
      :dsc_getfilepath => 'foo',
      :dsc_testfilepath => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlserverscript).new(
      :name     => 'foo',
      :dsc_serverinstance => 'foo',
      :dsc_setfilepath => 'foo',
      :dsc_getfilepath => 'foo',
      :dsc_testfilepath => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_variable => ["foo", "bar", "spec"],
      :dsc_getresult => ["foo", "bar", "spec"],
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlserverscript.to_s).to eq("Dsc_xsqlserverscript[foo]")
  end

  it 'should not accept array for dsc_serverinstance' do
    expect{dsc_xsqlserverscript[:dsc_serverinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serverinstance' do
    expect{dsc_xsqlserverscript[:dsc_serverinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serverinstance' do
    expect{dsc_xsqlserverscript[:dsc_serverinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serverinstance' do
    expect{dsc_xsqlserverscript[:dsc_serverinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_setfilepath is specified' do
    #dsc_xsqlserverscript[:dsc_setfilepath]
    expect { Puppet::Type.type(:dsc_xsqlserverscript).new(
      :name     => 'foo',
      :dsc_getfilepath => 'foo',
      :dsc_testfilepath => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_setfilepath is a required attribute/)
  end

  it 'should not accept array for dsc_setfilepath' do
    expect{dsc_xsqlserverscript[:dsc_setfilepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setfilepath' do
    expect{dsc_xsqlserverscript[:dsc_setfilepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setfilepath' do
    expect{dsc_xsqlserverscript[:dsc_setfilepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setfilepath' do
    expect{dsc_xsqlserverscript[:dsc_setfilepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_getfilepath is specified' do
    #dsc_xsqlserverscript[:dsc_getfilepath]
    expect { Puppet::Type.type(:dsc_xsqlserverscript).new(
      :name     => 'foo',
      :dsc_setfilepath => 'foo',
      :dsc_testfilepath => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_getfilepath is a required attribute/)
  end

  it 'should not accept array for dsc_getfilepath' do
    expect{dsc_xsqlserverscript[:dsc_getfilepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_getfilepath' do
    expect{dsc_xsqlserverscript[:dsc_getfilepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_getfilepath' do
    expect{dsc_xsqlserverscript[:dsc_getfilepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_getfilepath' do
    expect{dsc_xsqlserverscript[:dsc_getfilepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_testfilepath is specified' do
    #dsc_xsqlserverscript[:dsc_testfilepath]
    expect { Puppet::Type.type(:dsc_xsqlserverscript).new(
      :name     => 'foo',
      :dsc_setfilepath => 'foo',
      :dsc_getfilepath => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_testfilepath is a required attribute/)
  end

  it 'should not accept array for dsc_testfilepath' do
    expect{dsc_xsqlserverscript[:dsc_testfilepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_testfilepath' do
    expect{dsc_xsqlserverscript[:dsc_testfilepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_testfilepath' do
    expect{dsc_xsqlserverscript[:dsc_testfilepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_testfilepath' do
    expect{dsc_xsqlserverscript[:dsc_testfilepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xsqlserverscript[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xsqlserverscript[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xsqlserverscript[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xsqlserverscript[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xsqlserverscript[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_variable' do
    dsc_xsqlserverscript[:dsc_variable] = ["foo", "bar", "spec"]
    expect(dsc_xsqlserverscript[:dsc_variable]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_variable' do
    expect{dsc_xsqlserverscript[:dsc_variable] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_variable' do
    expect{dsc_xsqlserverscript[:dsc_variable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_variable' do
    expect{dsc_xsqlserverscript[:dsc_variable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_getresult' do
    dsc_xsqlserverscript[:dsc_getresult] = ["foo", "bar", "spec"]
    expect(dsc_xsqlserverscript[:dsc_getresult]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_getresult' do
    expect{dsc_xsqlserverscript[:dsc_getresult] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_getresult' do
    expect{dsc_xsqlserverscript[:dsc_getresult] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_getresult' do
    expect{dsc_xsqlserverscript[:dsc_getresult] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlserverscript)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlserverscript)
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
