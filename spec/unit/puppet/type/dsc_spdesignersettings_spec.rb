#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spdesignersettings) do

  let :dsc_spdesignersettings do
    Puppet::Type.type(:dsc_spdesignersettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spdesignersettings).new(
      :name     => 'foo',
      :dsc_url => 'foo',
      :dsc_settingsscope => 'WebApplication',
      :dsc_allowsharepointdesigner => true,
      :dsc_allowdetachpagesfromdefinition => true,
      :dsc_allowcustomisemasterpage => true,
      :dsc_allowmanagesiteurlstructure => true,
      :dsc_allowcreatedeclarativeworkflow => true,
      :dsc_allowsavepublishdeclarativeworkflow => true,
      :dsc_allowsavedeclarativeworkflowastemplate => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spdesignersettings.to_s).to eq("Dsc_spdesignersettings[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_spdesignersettings[:dsc_url]
    expect { Puppet::Type.type(:dsc_spdesignersettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_spdesignersettings[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_spdesignersettings[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_spdesignersettings[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_spdesignersettings[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_settingsscope predefined value WebApplication' do
    dsc_spdesignersettings[:dsc_settingsscope] = 'WebApplication'
    expect(dsc_spdesignersettings[:dsc_settingsscope]).to eq('WebApplication')
  end

  it 'should accept dsc_settingsscope predefined value webapplication' do
    dsc_spdesignersettings[:dsc_settingsscope] = 'webapplication'
    expect(dsc_spdesignersettings[:dsc_settingsscope]).to eq('webapplication')
  end

  it 'should accept dsc_settingsscope predefined value SiteCollection' do
    dsc_spdesignersettings[:dsc_settingsscope] = 'SiteCollection'
    expect(dsc_spdesignersettings[:dsc_settingsscope]).to eq('SiteCollection')
  end

  it 'should accept dsc_settingsscope predefined value sitecollection' do
    dsc_spdesignersettings[:dsc_settingsscope] = 'sitecollection'
    expect(dsc_spdesignersettings[:dsc_settingsscope]).to eq('sitecollection')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spdesignersettings[:dsc_settingsscope] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_settingsscope' do
    expect{dsc_spdesignersettings[:dsc_settingsscope] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_settingsscope' do
    expect{dsc_spdesignersettings[:dsc_settingsscope] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_settingsscope' do
    expect{dsc_spdesignersettings[:dsc_settingsscope] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_settingsscope' do
    expect{dsc_spdesignersettings[:dsc_settingsscope] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowsharepointdesigner' do
    expect{dsc_spdesignersettings[:dsc_allowsharepointdesigner] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowsharepointdesigner' do
    dsc_spdesignersettings[:dsc_allowsharepointdesigner] = true
    expect(dsc_spdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_spdesignersettings[:dsc_allowsharepointdesigner] = 'true'
    expect(dsc_spdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_spdesignersettings[:dsc_allowsharepointdesigner] = 'false'
    expect(dsc_spdesignersettings[:dsc_allowsharepointdesigner]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_spdesignersettings[:dsc_allowsharepointdesigner] = 'True'
    expect(dsc_spdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_spdesignersettings[:dsc_allowsharepointdesigner] = 'False'
    expect(dsc_spdesignersettings[:dsc_allowsharepointdesigner]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_spdesignersettings[:dsc_allowsharepointdesigner] = :true
    expect(dsc_spdesignersettings[:dsc_allowsharepointdesigner]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowsharepointdesigner" do
    dsc_spdesignersettings[:dsc_allowsharepointdesigner] = :false
    expect(dsc_spdesignersettings[:dsc_allowsharepointdesigner]).to eq(false)
  end

  it 'should not accept int for dsc_allowsharepointdesigner' do
    expect{dsc_spdesignersettings[:dsc_allowsharepointdesigner] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowsharepointdesigner' do
    expect{dsc_spdesignersettings[:dsc_allowsharepointdesigner] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowdetachpagesfromdefinition' do
    expect{dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowdetachpagesfromdefinition' do
    dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = true
    expect(dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'true'
    expect(dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'false'
    expect(dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'True'
    expect(dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = 'False'
    expect(dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = :true
    expect(dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowdetachpagesfromdefinition" do
    dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = :false
    expect(dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition]).to eq(false)
  end

  it 'should not accept int for dsc_allowdetachpagesfromdefinition' do
    expect{dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowdetachpagesfromdefinition' do
    expect{dsc_spdesignersettings[:dsc_allowdetachpagesfromdefinition] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowcustomisemasterpage' do
    expect{dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowcustomisemasterpage' do
    dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = true
    expect(dsc_spdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = 'true'
    expect(dsc_spdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = 'false'
    expect(dsc_spdesignersettings[:dsc_allowcustomisemasterpage]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = 'True'
    expect(dsc_spdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = 'False'
    expect(dsc_spdesignersettings[:dsc_allowcustomisemasterpage]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = :true
    expect(dsc_spdesignersettings[:dsc_allowcustomisemasterpage]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowcustomisemasterpage" do
    dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = :false
    expect(dsc_spdesignersettings[:dsc_allowcustomisemasterpage]).to eq(false)
  end

  it 'should not accept int for dsc_allowcustomisemasterpage' do
    expect{dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowcustomisemasterpage' do
    expect{dsc_spdesignersettings[:dsc_allowcustomisemasterpage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowmanagesiteurlstructure' do
    expect{dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowmanagesiteurlstructure' do
    dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = true
    expect(dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = 'true'
    expect(dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = 'false'
    expect(dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = 'True'
    expect(dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = 'False'
    expect(dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = :true
    expect(dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowmanagesiteurlstructure" do
    dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = :false
    expect(dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure]).to eq(false)
  end

  it 'should not accept int for dsc_allowmanagesiteurlstructure' do
    expect{dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowmanagesiteurlstructure' do
    expect{dsc_spdesignersettings[:dsc_allowmanagesiteurlstructure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowcreatedeclarativeworkflow' do
    expect{dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowcreatedeclarativeworkflow' do
    dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = true
    expect(dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'true'
    expect(dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'false'
    expect(dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'True'
    expect(dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 'False'
    expect(dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = :true
    expect(dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowcreatedeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = :false
    expect(dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow]).to eq(false)
  end

  it 'should not accept int for dsc_allowcreatedeclarativeworkflow' do
    expect{dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowcreatedeclarativeworkflow' do
    expect{dsc_spdesignersettings[:dsc_allowcreatedeclarativeworkflow] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowsavepublishdeclarativeworkflow' do
    expect{dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowsavepublishdeclarativeworkflow' do
    dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = true
    expect(dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'true'
    expect(dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'false'
    expect(dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'True'
    expect(dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 'False'
    expect(dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = :true
    expect(dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowsavepublishdeclarativeworkflow" do
    dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = :false
    expect(dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow]).to eq(false)
  end

  it 'should not accept int for dsc_allowsavepublishdeclarativeworkflow' do
    expect{dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowsavepublishdeclarativeworkflow' do
    expect{dsc_spdesignersettings[:dsc_allowsavepublishdeclarativeworkflow] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowsavedeclarativeworkflowastemplate' do
    expect{dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowsavedeclarativeworkflowastemplate' do
    dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = true
    expect(dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'true'
    expect(dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'false'
    expect(dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'True'
    expect(dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 'False'
    expect(dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = :true
    expect(dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowsavedeclarativeworkflowastemplate" do
    dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = :false
    expect(dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate]).to eq(false)
  end

  it 'should not accept int for dsc_allowsavedeclarativeworkflowastemplate' do
    expect{dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowsavedeclarativeworkflowastemplate' do
    expect{dsc_spdesignersettings[:dsc_allowsavedeclarativeworkflowastemplate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spdesignersettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spdesignersettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spdesignersettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spdesignersettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spdesignersettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spdesignersettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spdesignersettings)
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
