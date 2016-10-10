#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spsearchresultsource) do

  let :dsc_spsearchresultsource do
    Puppet::Type.type(:dsc_spsearchresultsource).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spsearchresultsource).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_searchserviceappname => 'foo',
      :dsc_query => 'foo',
      :dsc_providertype => 'Exchange Search Provider',
      :dsc_connectionurl => 'foo',
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spsearchresultsource.to_s).to eq("Dsc_spsearchresultsource[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spsearchresultsource[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spsearchresultsource[:dsc_name]
    expect { Puppet::Type.type(:dsc_spsearchresultsource).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spsearchresultsource[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spsearchresultsource[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spsearchresultsource[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spsearchresultsource[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_searchserviceappname' do
    expect{dsc_spsearchresultsource[:dsc_searchserviceappname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_searchserviceappname' do
    expect{dsc_spsearchresultsource[:dsc_searchserviceappname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_searchserviceappname' do
    expect{dsc_spsearchresultsource[:dsc_searchserviceappname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_searchserviceappname' do
    expect{dsc_spsearchresultsource[:dsc_searchserviceappname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_query' do
    expect{dsc_spsearchresultsource[:dsc_query] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_query' do
    expect{dsc_spsearchresultsource[:dsc_query] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_query' do
    expect{dsc_spsearchresultsource[:dsc_query] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_query' do
    expect{dsc_spsearchresultsource[:dsc_query] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_providertype predefined value Exchange Search Provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'Exchange Search Provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('Exchange Search Provider')
  end

  it 'should accept dsc_providertype predefined value exchange search provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'exchange search provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('exchange search provider')
  end

  it 'should accept dsc_providertype predefined value Local People Provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'Local People Provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('Local People Provider')
  end

  it 'should accept dsc_providertype predefined value local people provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'local people provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('local people provider')
  end

  it 'should accept dsc_providertype predefined value Local SharePoint Provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'Local SharePoint Provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('Local SharePoint Provider')
  end

  it 'should accept dsc_providertype predefined value local sharepoint provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'local sharepoint provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('local sharepoint provider')
  end

  it 'should accept dsc_providertype predefined value OpenSearch Provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'OpenSearch Provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('OpenSearch Provider')
  end

  it 'should accept dsc_providertype predefined value opensearch provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'opensearch provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('opensearch provider')
  end

  it 'should accept dsc_providertype predefined value Remote People Provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'Remote People Provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('Remote People Provider')
  end

  it 'should accept dsc_providertype predefined value remote people provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'remote people provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('remote people provider')
  end

  it 'should accept dsc_providertype predefined value Remote SharePoint Provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'Remote SharePoint Provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('Remote SharePoint Provider')
  end

  it 'should accept dsc_providertype predefined value remote sharepoint provider' do
    dsc_spsearchresultsource[:dsc_providertype] = 'remote sharepoint provider'
    expect(dsc_spsearchresultsource[:dsc_providertype]).to eq('remote sharepoint provider')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsearchresultsource[:dsc_providertype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_providertype' do
    expect{dsc_spsearchresultsource[:dsc_providertype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_providertype' do
    expect{dsc_spsearchresultsource[:dsc_providertype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_providertype' do
    expect{dsc_spsearchresultsource[:dsc_providertype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_providertype' do
    expect{dsc_spsearchresultsource[:dsc_providertype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectionurl' do
    expect{dsc_spsearchresultsource[:dsc_connectionurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectionurl' do
    expect{dsc_spsearchresultsource[:dsc_connectionurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectionurl' do
    expect{dsc_spsearchresultsource[:dsc_connectionurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectionurl' do
    expect{dsc_spsearchresultsource[:dsc_connectionurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spsearchresultsource[:dsc_ensure] = 'Present'
    expect(dsc_spsearchresultsource[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spsearchresultsource[:dsc_ensure] = 'present'
    expect(dsc_spsearchresultsource[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spsearchresultsource[:dsc_ensure] = 'present'
    expect(dsc_spsearchresultsource[:ensure]).to eq(dsc_spsearchresultsource[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spsearchresultsource[:dsc_ensure] = 'Absent'
    expect(dsc_spsearchresultsource[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spsearchresultsource[:dsc_ensure] = 'absent'
    expect(dsc_spsearchresultsource[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spsearchresultsource[:dsc_ensure] = 'absent'
    expect(dsc_spsearchresultsource[:ensure]).to eq(dsc_spsearchresultsource[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsearchresultsource[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spsearchresultsource[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spsearchresultsource[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spsearchresultsource[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spsearchresultsource[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spsearchresultsource[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spsearchresultsource[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spsearchresultsource[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spsearchresultsource[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spsearchresultsource[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spsearchresultsource)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spsearchresultsource)
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
        dsc_spsearchresultsource.original_parameters[:dsc_ensure] = 'present'
        dsc_spsearchresultsource[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spsearchresultsource)
      end

      it "should update :ensure to :present" do
        expect(dsc_spsearchresultsource[:ensure]).to eq(:present)
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
        dsc_spsearchresultsource.original_parameters[:dsc_ensure] = 'absent'
        dsc_spsearchresultsource[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spsearchresultsource)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spsearchresultsource[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
