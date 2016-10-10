#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchmailboxtransportservice) do

  let :dsc_xexchmailboxtransportservice do
    Puppet::Type.type(:dsc_xexchmailboxtransportservice).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xexchmailboxtransportservice).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_connectivitylogenabled => true,
      :dsc_connectivitylogmaxage => 'foo',
      :dsc_connectivitylogmaxdirectorysize => 'foo',
      :dsc_connectivitylogmaxfilesize => 'foo',
      :dsc_connectivitylogpath => 'foo',
      :dsc_contentconversiontracingenabled => true,
      :dsc_maxconcurrentmailboxdeliveries => -32,
      :dsc_maxconcurrentmailboxsubmissions => -32,
      :dsc_pipelinetracingenabled => true,
      :dsc_pipelinetracingpath => 'foo',
      :dsc_pipelinetracingsenderaddress => 'foo',
      :dsc_receiveprotocollogmaxage => 'foo',
      :dsc_receiveprotocollogmaxdirectorysize => 'foo',
      :dsc_receiveprotocollogmaxfilesize => 'foo',
      :dsc_receiveprotocollogpath => 'foo',
      :dsc_routingtablelogmaxage => 'foo',
      :dsc_routingtablelogmaxdirectorysize => 'foo',
      :dsc_routingtablelogpath => 'foo',
      :dsc_sendprotocollogmaxage => 'foo',
      :dsc_sendprotocollogmaxdirectorysize => 'foo',
      :dsc_sendprotocollogmaxfilesize => 'foo',
      :dsc_sendprotocollogpath => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xexchmailboxtransportservice.to_s).to eq("Dsc_xexchmailboxtransportservice[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchmailboxtransportservice[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchmailboxtransportservice).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchmailboxtransportservice[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchmailboxtransportservice[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchmailboxtransportservice[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchmailboxtransportservice[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchmailboxtransportservice[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchmailboxtransportservice[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchmailboxtransportservice[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchmailboxtransportservice[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchmailboxtransportservice[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = true
    expect(dsc_xexchmailboxtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchmailboxtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchmailboxtransportservice[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchmailboxtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchmailboxtransportservice[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = :true
    expect(dsc_xexchmailboxtransportservice[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = :false
    expect(dsc_xexchmailboxtransportservice[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchmailboxtransportservice[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_connectivitylogenabled' do
    dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = true
    expect(dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = 'true'
    expect(dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = 'false'
    expect(dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = 'True'
    expect(dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = 'False'
    expect(dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = :true
    expect(dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_connectivitylogenabled" do
    dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = :false
    expect(dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled]).to eq(false)
  end

  it 'should not accept int for dsc_connectivitylogenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectivitylogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectivitylogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectivitylogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectivitylogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_connectivitylogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_contentconversiontracingenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_contentconversiontracingenabled' do
    dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = true
    expect(dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = 'true'
    expect(dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = 'false'
    expect(dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = 'True'
    expect(dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = 'False'
    expect(dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = :true
    expect(dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_contentconversiontracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = :false
    expect(dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_contentconversiontracingenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentconversiontracingenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_contentconversiontracingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxconcurrentmailboxdeliveries' do
    expect{dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxconcurrentmailboxdeliveries' do
    expect{dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries] = -32
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '16'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '-16'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '32'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxdeliveries' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries] = '-32'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxdeliveries]).to eq(-32)
  end


  it 'should not accept array for dsc_maxconcurrentmailboxsubmissions' do
    expect{dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxconcurrentmailboxsubmissions' do
    expect{dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions] = -32
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '16'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '-16'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '32'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxconcurrentmailboxsubmissions' do
    dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions] = '-32'
    expect(dsc_xexchmailboxtransportservice[:dsc_maxconcurrentmailboxsubmissions]).to eq(-32)
  end


  it 'should not accept array for dsc_pipelinetracingenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_pipelinetracingenabled' do
    dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = true
    expect(dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = 'true'
    expect(dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = 'false'
    expect(dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = 'True'
    expect(dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = 'False'
    expect(dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = :true
    expect(dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_pipelinetracingenabled" do
    dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = :false
    expect(dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_pipelinetracingenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipelinetracingenabled' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pipelinetracingpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pipelinetracingpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pipelinetracingpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipelinetracingpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingsenderaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingsenderaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingsenderaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipelinetracingsenderaddress' do
    expect{dsc_xexchmailboxtransportservice[:dsc_pipelinetracingsenderaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_receiveprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_receiveprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_receiveprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_receiveprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_receiveprotocollogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_routingtablelogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_routingtablelogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_routingtablelogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_routingtablelogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_routingtablelogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_routingtablelogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_routingtablelogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_routingtablelogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_routingtablelogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_routingtablelogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogmaxage' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxage] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxdirectorysize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxdirectorysize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxdirectorysize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogmaxdirectorysize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxdirectorysize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxfilesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxfilesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxfilesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogmaxfilesize' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogmaxfilesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sendprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sendprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendprotocollogpath' do
    expect{dsc_xexchmailboxtransportservice[:dsc_sendprotocollogpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchmailboxtransportservice)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchmailboxtransportservice)
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
