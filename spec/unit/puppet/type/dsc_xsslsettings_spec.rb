#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsslsettings) do

  let :dsc_xsslsettings do
    Puppet::Type.type(:dsc_xsslsettings).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsslsettings).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_bindings => '',
      :dsc_ensure => 'Present',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsslsettings.to_s).to eq("Dsc_xsslsettings[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsslsettings[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xsslsettings[:dsc_name]
    expect { Puppet::Type.type(:dsc_xsslsettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsslsettings[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsslsettings[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsslsettings[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsslsettings[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_bindings predefined value ' do
    dsc_xsslsettings[:dsc_bindings] = ''
    expect(dsc_xsslsettings[:dsc_bindings]).to eq([''])
  end

  it 'should accept dsc_bindings predefined value ' do
    dsc_xsslsettings[:dsc_bindings] = ''
    expect(dsc_xsslsettings[:dsc_bindings]).to eq([''])
  end

  it 'should accept dsc_bindings predefined value Ssl' do
    dsc_xsslsettings[:dsc_bindings] = 'Ssl'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['Ssl'])
  end

  it 'should accept dsc_bindings predefined value ssl' do
    dsc_xsslsettings[:dsc_bindings] = 'ssl'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['ssl'])
  end

  it 'should accept dsc_bindings predefined value SslNegotiateCert' do
    dsc_xsslsettings[:dsc_bindings] = 'SslNegotiateCert'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['SslNegotiateCert'])
  end

  it 'should accept dsc_bindings predefined value sslnegotiatecert' do
    dsc_xsslsettings[:dsc_bindings] = 'sslnegotiatecert'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['sslnegotiatecert'])
  end

  it 'should accept dsc_bindings predefined value SslRequireCert' do
    dsc_xsslsettings[:dsc_bindings] = 'SslRequireCert'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['SslRequireCert'])
  end

  it 'should accept dsc_bindings predefined value sslrequirecert' do
    dsc_xsslsettings[:dsc_bindings] = 'sslrequirecert'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['sslrequirecert'])
  end

  it 'should accept dsc_bindings predefined value Ssl128' do
    dsc_xsslsettings[:dsc_bindings] = 'Ssl128'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['Ssl128'])
  end

  it 'should accept dsc_bindings predefined value ssl128' do
    dsc_xsslsettings[:dsc_bindings] = 'ssl128'
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(['ssl128'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsslsettings[:dsc_bindings] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_bindings' do
    dsc_xsslsettings[:dsc_bindings] = ["", "Ssl", "SslNegotiateCert", "SslRequireCert", "Ssl128"]
    expect(dsc_xsslsettings[:dsc_bindings]).to eq(["", "Ssl", "SslNegotiateCert", "SslRequireCert", "Ssl128"])
  end

  it 'should not accept boolean for dsc_bindings' do
    expect{dsc_xsslsettings[:dsc_bindings] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_bindings' do
    expect{dsc_xsslsettings[:dsc_bindings] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_bindings' do
    expect{dsc_xsslsettings[:dsc_bindings] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsslsettings[:dsc_ensure] = 'Present'
    expect(dsc_xsslsettings[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsslsettings[:dsc_ensure] = 'present'
    expect(dsc_xsslsettings[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsslsettings[:dsc_ensure] = 'present'
    expect(dsc_xsslsettings[:ensure]).to eq(dsc_xsslsettings[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsslsettings[:dsc_ensure] = 'Absent'
    expect(dsc_xsslsettings[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsslsettings[:dsc_ensure] = 'absent'
    expect(dsc_xsslsettings[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsslsettings[:dsc_ensure] = 'absent'
    expect(dsc_xsslsettings[:ensure]).to eq(dsc_xsslsettings[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsslsettings[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsslsettings[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsslsettings[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsslsettings[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsslsettings[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsslsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsslsettings)
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

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xsslsettings.original_parameters[:dsc_ensure] = 'present'
        dsc_xsslsettings[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsslsettings)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsslsettings[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xsslsettings.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsslsettings[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsslsettings)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsslsettings[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
