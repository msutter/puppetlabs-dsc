#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwordautomationserviceapp) do

  let :dsc_spwordautomationserviceapp do
    Puppet::Type.type(:dsc_spwordautomationserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwordautomationserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_ensure => 'Present',
      :dsc_applicationpool => 'foo',
      :dsc_databasename => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_supportedfileformats => 'docx',
      :dsc_disableembeddedfonts => true,
      :dsc_maximummemoryusage => 32,
      :dsc_recyclethreshold => 32,
      :dsc_disablebinaryfilescan => true,
      :dsc_conversionprocesses => 32,
      :dsc_jobconversionfrequency => 32,
      :dsc_numberofconversionsperprocess => 32,
      :dsc_timebeforeconversionismonitored => 32,
      :dsc_maximumconversionattempts => 32,
      :dsc_maximumsyncconversionrequests => 32,
      :dsc_keepalivetimeout => 32,
      :dsc_maximumconversiontime => 32,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwordautomationserviceapp.to_s).to eq("Dsc_spwordautomationserviceapp[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spwordautomationserviceapp[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spwordautomationserviceapp[:dsc_name]
    expect { Puppet::Type.type(:dsc_spwordautomationserviceapp).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spwordautomationserviceapp[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spwordautomationserviceapp[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spwordautomationserviceapp[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spwordautomationserviceapp[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spwordautomationserviceapp[:dsc_ensure] = 'Present'
    expect(dsc_spwordautomationserviceapp[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spwordautomationserviceapp[:dsc_ensure] = 'present'
    expect(dsc_spwordautomationserviceapp[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spwordautomationserviceapp[:dsc_ensure] = 'present'
    expect(dsc_spwordautomationserviceapp[:ensure]).to eq(dsc_spwordautomationserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spwordautomationserviceapp[:dsc_ensure] = 'Absent'
    expect(dsc_spwordautomationserviceapp[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spwordautomationserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_spwordautomationserviceapp[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spwordautomationserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_spwordautomationserviceapp[:ensure]).to eq(dsc_spwordautomationserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwordautomationserviceapp[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spwordautomationserviceapp[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spwordautomationserviceapp[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spwordautomationserviceapp[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spwordautomationserviceapp[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_spwordautomationserviceapp[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_spwordautomationserviceapp[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_spwordautomationserviceapp[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_spwordautomationserviceapp[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_spwordautomationserviceapp[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_spwordautomationserviceapp[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_spwordautomationserviceapp[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_spwordautomationserviceapp[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_spwordautomationserviceapp[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_spwordautomationserviceapp[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_spwordautomationserviceapp[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_spwordautomationserviceapp[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_supportedfileformats predefined value docx' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'docx'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['docx'])
  end

  it 'should accept dsc_supportedfileformats predefined value docx' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'docx'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['docx'])
  end

  it 'should accept dsc_supportedfileformats predefined value doc' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'doc'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['doc'])
  end

  it 'should accept dsc_supportedfileformats predefined value doc' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'doc'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['doc'])
  end

  it 'should accept dsc_supportedfileformats predefined value mht' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'mht'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['mht'])
  end

  it 'should accept dsc_supportedfileformats predefined value mht' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'mht'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['mht'])
  end

  it 'should accept dsc_supportedfileformats predefined value rtf' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'rtf'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['rtf'])
  end

  it 'should accept dsc_supportedfileformats predefined value rtf' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'rtf'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['rtf'])
  end

  it 'should accept dsc_supportedfileformats predefined value xml' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'xml'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['xml'])
  end

  it 'should accept dsc_supportedfileformats predefined value xml' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'xml'
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(['xml'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_supportedfileformats' do
    dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = ["docx", "doc", "mht", "rtf", "xml"]
    expect(dsc_spwordautomationserviceapp[:dsc_supportedfileformats]).to eq(["docx", "doc", "mht", "rtf", "xml"])
  end

  it 'should not accept boolean for dsc_supportedfileformats' do
    expect{dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_supportedfileformats' do
    expect{dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_supportedfileformats' do
    expect{dsc_spwordautomationserviceapp[:dsc_supportedfileformats] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disableembeddedfonts' do
    expect{dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disableembeddedfonts' do
    dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = true
    expect(dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disableembeddedfonts" do
    dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = 'true'
    expect(dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disableembeddedfonts" do
    dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = 'false'
    expect(dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disableembeddedfonts" do
    dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = 'True'
    expect(dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disableembeddedfonts" do
    dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = 'False'
    expect(dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disableembeddedfonts" do
    dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = :true
    expect(dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disableembeddedfonts" do
    dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = :false
    expect(dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts]).to eq(false)
  end

  it 'should not accept int for dsc_disableembeddedfonts' do
    expect{dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disableembeddedfonts' do
    expect{dsc_spwordautomationserviceapp[:dsc_disableembeddedfonts] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maximummemoryusage' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximummemoryusage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximummemoryusage' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximummemoryusage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximummemoryusage' do
    dsc_spwordautomationserviceapp[:dsc_maximummemoryusage] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_maximummemoryusage]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maximummemoryusage' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_maximummemoryusage] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maximummemoryusage' do
    dsc_spwordautomationserviceapp[:dsc_maximummemoryusage] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_maximummemoryusage]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maximummemoryusage' do
    dsc_spwordautomationserviceapp[:dsc_maximummemoryusage] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_maximummemoryusage]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maximummemoryusage' do
    dsc_spwordautomationserviceapp[:dsc_maximummemoryusage] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_maximummemoryusage]).to eq(64)
  end

  it 'should not accept array for dsc_recyclethreshold' do
    expect{dsc_spwordautomationserviceapp[:dsc_recyclethreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_recyclethreshold' do
    expect{dsc_spwordautomationserviceapp[:dsc_recyclethreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_recyclethreshold' do
    dsc_spwordautomationserviceapp[:dsc_recyclethreshold] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_recyclethreshold]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_recyclethreshold' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_recyclethreshold] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_recyclethreshold' do
    dsc_spwordautomationserviceapp[:dsc_recyclethreshold] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_recyclethreshold]).to eq(16)
  end

  it 'should accept string-like uint for dsc_recyclethreshold' do
    dsc_spwordautomationserviceapp[:dsc_recyclethreshold] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_recyclethreshold]).to eq(32)
  end

  it 'should accept string-like uint for dsc_recyclethreshold' do
    dsc_spwordautomationserviceapp[:dsc_recyclethreshold] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_recyclethreshold]).to eq(64)
  end

  it 'should not accept array for dsc_disablebinaryfilescan' do
    expect{dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disablebinaryfilescan' do
    dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = true
    expect(dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disablebinaryfilescan" do
    dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = 'true'
    expect(dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disablebinaryfilescan" do
    dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = 'false'
    expect(dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disablebinaryfilescan" do
    dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = 'True'
    expect(dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disablebinaryfilescan" do
    dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = 'False'
    expect(dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disablebinaryfilescan" do
    dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = :true
    expect(dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disablebinaryfilescan" do
    dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = :false
    expect(dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan]).to eq(false)
  end

  it 'should not accept int for dsc_disablebinaryfilescan' do
    expect{dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disablebinaryfilescan' do
    expect{dsc_spwordautomationserviceapp[:dsc_disablebinaryfilescan] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_conversionprocesses' do
    expect{dsc_spwordautomationserviceapp[:dsc_conversionprocesses] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_conversionprocesses' do
    expect{dsc_spwordautomationserviceapp[:dsc_conversionprocesses] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_conversionprocesses' do
    dsc_spwordautomationserviceapp[:dsc_conversionprocesses] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_conversionprocesses]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_conversionprocesses' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_conversionprocesses] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_conversionprocesses' do
    dsc_spwordautomationserviceapp[:dsc_conversionprocesses] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_conversionprocesses]).to eq(16)
  end

  it 'should accept string-like uint for dsc_conversionprocesses' do
    dsc_spwordautomationserviceapp[:dsc_conversionprocesses] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_conversionprocesses]).to eq(32)
  end

  it 'should accept string-like uint for dsc_conversionprocesses' do
    dsc_spwordautomationserviceapp[:dsc_conversionprocesses] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_conversionprocesses]).to eq(64)
  end

  it 'should not accept array for dsc_jobconversionfrequency' do
    expect{dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_jobconversionfrequency' do
    expect{dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_jobconversionfrequency' do
    dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_jobconversionfrequency' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_jobconversionfrequency' do
    dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency]).to eq(16)
  end

  it 'should accept string-like uint for dsc_jobconversionfrequency' do
    dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency]).to eq(32)
  end

  it 'should accept string-like uint for dsc_jobconversionfrequency' do
    dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_jobconversionfrequency]).to eq(64)
  end

  it 'should not accept array for dsc_numberofconversionsperprocess' do
    expect{dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_numberofconversionsperprocess' do
    expect{dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_numberofconversionsperprocess' do
    dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_numberofconversionsperprocess' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_numberofconversionsperprocess' do
    dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess]).to eq(16)
  end

  it 'should accept string-like uint for dsc_numberofconversionsperprocess' do
    dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess]).to eq(32)
  end

  it 'should accept string-like uint for dsc_numberofconversionsperprocess' do
    dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_numberofconversionsperprocess]).to eq(64)
  end

  it 'should not accept array for dsc_timebeforeconversionismonitored' do
    expect{dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_timebeforeconversionismonitored' do
    expect{dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_timebeforeconversionismonitored' do
    dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_timebeforeconversionismonitored' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_timebeforeconversionismonitored' do
    dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored]).to eq(16)
  end

  it 'should accept string-like uint for dsc_timebeforeconversionismonitored' do
    dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored]).to eq(32)
  end

  it 'should accept string-like uint for dsc_timebeforeconversionismonitored' do
    dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_timebeforeconversionismonitored]).to eq(64)
  end

  it 'should not accept array for dsc_maximumconversionattempts' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumconversionattempts' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumconversionattempts' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maximumconversionattempts' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maximumconversionattempts' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maximumconversionattempts' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maximumconversionattempts' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversionattempts]).to eq(64)
  end

  it 'should not accept array for dsc_maximumsyncconversionrequests' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumsyncconversionrequests' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumsyncconversionrequests' do
    dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maximumsyncconversionrequests' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maximumsyncconversionrequests' do
    dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maximumsyncconversionrequests' do
    dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maximumsyncconversionrequests' do
    dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumsyncconversionrequests]).to eq(64)
  end

  it 'should not accept array for dsc_keepalivetimeout' do
    expect{dsc_spwordautomationserviceapp[:dsc_keepalivetimeout] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_keepalivetimeout' do
    expect{dsc_spwordautomationserviceapp[:dsc_keepalivetimeout] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_keepalivetimeout' do
    dsc_spwordautomationserviceapp[:dsc_keepalivetimeout] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_keepalivetimeout]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_keepalivetimeout' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_keepalivetimeout] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_keepalivetimeout' do
    dsc_spwordautomationserviceapp[:dsc_keepalivetimeout] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_keepalivetimeout]).to eq(16)
  end

  it 'should accept string-like uint for dsc_keepalivetimeout' do
    dsc_spwordautomationserviceapp[:dsc_keepalivetimeout] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_keepalivetimeout]).to eq(32)
  end

  it 'should accept string-like uint for dsc_keepalivetimeout' do
    dsc_spwordautomationserviceapp[:dsc_keepalivetimeout] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_keepalivetimeout]).to eq(64)
  end

  it 'should not accept array for dsc_maximumconversiontime' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximumconversiontime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumconversiontime' do
    expect{dsc_spwordautomationserviceapp[:dsc_maximumconversiontime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumconversiontime' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversiontime] = 32
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversiontime]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maximumconversiontime' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spwordautomationserviceapp[:dsc_maximumconversiontime] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maximumconversiontime' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversiontime] = '16'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversiontime]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maximumconversiontime' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversiontime] = '32'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversiontime]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maximumconversiontime' do
    dsc_spwordautomationserviceapp[:dsc_maximumconversiontime] = '64'
    expect(dsc_spwordautomationserviceapp[:dsc_maximumconversiontime]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwordautomationserviceapp[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwordautomationserviceapp[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwordautomationserviceapp[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwordautomationserviceapp[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spwordautomationserviceapp[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwordautomationserviceapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwordautomationserviceapp)
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
        dsc_spwordautomationserviceapp.original_parameters[:dsc_ensure] = 'present'
        dsc_spwordautomationserviceapp[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spwordautomationserviceapp)
      end

      it "should update :ensure to :present" do
        expect(dsc_spwordautomationserviceapp[:ensure]).to eq(:present)
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
        dsc_spwordautomationserviceapp.original_parameters[:dsc_ensure] = 'absent'
        dsc_spwordautomationserviceapp[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spwordautomationserviceapp)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spwordautomationserviceapp[:ensure]).to eq(:absent)
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
