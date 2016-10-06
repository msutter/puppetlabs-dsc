#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xpendingreboot) do

  let :dsc_xpendingreboot do
    Puppet::Type.type(:dsc_xpendingreboot).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xpendingreboot).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_skipcomponentbasedservicing => true,
      :dsc_componentbasedservicing => true,
      :dsc_skipwindowsupdate => true,
      :dsc_windowsupdate => true,
      :dsc_skippendingfilerename => true,
      :dsc_pendingfilerename => true,
      :dsc_skippendingcomputerrename => true,
      :dsc_pendingcomputerrename => true,
      :dsc_skipccmclientsdk => true,
      :dsc_ccmclientsdk => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xpendingreboot.to_s).to eq("Dsc_xpendingreboot[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xpendingreboot[:dsc_name]
    expect { Puppet::Type.type(:dsc_xpendingreboot).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xpendingreboot[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xpendingreboot[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xpendingreboot[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xpendingreboot[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skipcomponentbasedservicing' do
    expect{dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skipcomponentbasedservicing' do
    dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = true
    expect(dsc_xpendingreboot[:dsc_skipcomponentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skipcomponentbasedservicing" do
    dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = 'true'
    expect(dsc_xpendingreboot[:dsc_skipcomponentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skipcomponentbasedservicing" do
    dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = 'false'
    expect(dsc_xpendingreboot[:dsc_skipcomponentbasedservicing]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skipcomponentbasedservicing" do
    dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = 'True'
    expect(dsc_xpendingreboot[:dsc_skipcomponentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skipcomponentbasedservicing" do
    dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = 'False'
    expect(dsc_xpendingreboot[:dsc_skipcomponentbasedservicing]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skipcomponentbasedservicing" do
    dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = :true
    expect(dsc_xpendingreboot[:dsc_skipcomponentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skipcomponentbasedservicing" do
    dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = :false
    expect(dsc_xpendingreboot[:dsc_skipcomponentbasedservicing]).to eq(false)
  end

  it 'should not accept int for dsc_skipcomponentbasedservicing' do
    expect{dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skipcomponentbasedservicing' do
    expect{dsc_xpendingreboot[:dsc_skipcomponentbasedservicing] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_componentbasedservicing' do
    expect{dsc_xpendingreboot[:dsc_componentbasedservicing] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_componentbasedservicing' do
    dsc_xpendingreboot[:dsc_componentbasedservicing] = true
    expect(dsc_xpendingreboot[:dsc_componentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_componentbasedservicing" do
    dsc_xpendingreboot[:dsc_componentbasedservicing] = 'true'
    expect(dsc_xpendingreboot[:dsc_componentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_componentbasedservicing" do
    dsc_xpendingreboot[:dsc_componentbasedservicing] = 'false'
    expect(dsc_xpendingreboot[:dsc_componentbasedservicing]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_componentbasedservicing" do
    dsc_xpendingreboot[:dsc_componentbasedservicing] = 'True'
    expect(dsc_xpendingreboot[:dsc_componentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_componentbasedservicing" do
    dsc_xpendingreboot[:dsc_componentbasedservicing] = 'False'
    expect(dsc_xpendingreboot[:dsc_componentbasedservicing]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_componentbasedservicing" do
    dsc_xpendingreboot[:dsc_componentbasedservicing] = :true
    expect(dsc_xpendingreboot[:dsc_componentbasedservicing]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_componentbasedservicing" do
    dsc_xpendingreboot[:dsc_componentbasedservicing] = :false
    expect(dsc_xpendingreboot[:dsc_componentbasedservicing]).to eq(false)
  end

  it 'should not accept int for dsc_componentbasedservicing' do
    expect{dsc_xpendingreboot[:dsc_componentbasedservicing] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_componentbasedservicing' do
    expect{dsc_xpendingreboot[:dsc_componentbasedservicing] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skipwindowsupdate' do
    expect{dsc_xpendingreboot[:dsc_skipwindowsupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skipwindowsupdate' do
    dsc_xpendingreboot[:dsc_skipwindowsupdate] = true
    expect(dsc_xpendingreboot[:dsc_skipwindowsupdate]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skipwindowsupdate" do
    dsc_xpendingreboot[:dsc_skipwindowsupdate] = 'true'
    expect(dsc_xpendingreboot[:dsc_skipwindowsupdate]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skipwindowsupdate" do
    dsc_xpendingreboot[:dsc_skipwindowsupdate] = 'false'
    expect(dsc_xpendingreboot[:dsc_skipwindowsupdate]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skipwindowsupdate" do
    dsc_xpendingreboot[:dsc_skipwindowsupdate] = 'True'
    expect(dsc_xpendingreboot[:dsc_skipwindowsupdate]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skipwindowsupdate" do
    dsc_xpendingreboot[:dsc_skipwindowsupdate] = 'False'
    expect(dsc_xpendingreboot[:dsc_skipwindowsupdate]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skipwindowsupdate" do
    dsc_xpendingreboot[:dsc_skipwindowsupdate] = :true
    expect(dsc_xpendingreboot[:dsc_skipwindowsupdate]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skipwindowsupdate" do
    dsc_xpendingreboot[:dsc_skipwindowsupdate] = :false
    expect(dsc_xpendingreboot[:dsc_skipwindowsupdate]).to eq(false)
  end

  it 'should not accept int for dsc_skipwindowsupdate' do
    expect{dsc_xpendingreboot[:dsc_skipwindowsupdate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skipwindowsupdate' do
    expect{dsc_xpendingreboot[:dsc_skipwindowsupdate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windowsupdate' do
    expect{dsc_xpendingreboot[:dsc_windowsupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windowsupdate' do
    dsc_xpendingreboot[:dsc_windowsupdate] = true
    expect(dsc_xpendingreboot[:dsc_windowsupdate]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windowsupdate" do
    dsc_xpendingreboot[:dsc_windowsupdate] = 'true'
    expect(dsc_xpendingreboot[:dsc_windowsupdate]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windowsupdate" do
    dsc_xpendingreboot[:dsc_windowsupdate] = 'false'
    expect(dsc_xpendingreboot[:dsc_windowsupdate]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windowsupdate" do
    dsc_xpendingreboot[:dsc_windowsupdate] = 'True'
    expect(dsc_xpendingreboot[:dsc_windowsupdate]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windowsupdate" do
    dsc_xpendingreboot[:dsc_windowsupdate] = 'False'
    expect(dsc_xpendingreboot[:dsc_windowsupdate]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windowsupdate" do
    dsc_xpendingreboot[:dsc_windowsupdate] = :true
    expect(dsc_xpendingreboot[:dsc_windowsupdate]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windowsupdate" do
    dsc_xpendingreboot[:dsc_windowsupdate] = :false
    expect(dsc_xpendingreboot[:dsc_windowsupdate]).to eq(false)
  end

  it 'should not accept int for dsc_windowsupdate' do
    expect{dsc_xpendingreboot[:dsc_windowsupdate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windowsupdate' do
    expect{dsc_xpendingreboot[:dsc_windowsupdate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skippendingfilerename' do
    expect{dsc_xpendingreboot[:dsc_skippendingfilerename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skippendingfilerename' do
    dsc_xpendingreboot[:dsc_skippendingfilerename] = true
    expect(dsc_xpendingreboot[:dsc_skippendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skippendingfilerename" do
    dsc_xpendingreboot[:dsc_skippendingfilerename] = 'true'
    expect(dsc_xpendingreboot[:dsc_skippendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skippendingfilerename" do
    dsc_xpendingreboot[:dsc_skippendingfilerename] = 'false'
    expect(dsc_xpendingreboot[:dsc_skippendingfilerename]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skippendingfilerename" do
    dsc_xpendingreboot[:dsc_skippendingfilerename] = 'True'
    expect(dsc_xpendingreboot[:dsc_skippendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skippendingfilerename" do
    dsc_xpendingreboot[:dsc_skippendingfilerename] = 'False'
    expect(dsc_xpendingreboot[:dsc_skippendingfilerename]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skippendingfilerename" do
    dsc_xpendingreboot[:dsc_skippendingfilerename] = :true
    expect(dsc_xpendingreboot[:dsc_skippendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skippendingfilerename" do
    dsc_xpendingreboot[:dsc_skippendingfilerename] = :false
    expect(dsc_xpendingreboot[:dsc_skippendingfilerename]).to eq(false)
  end

  it 'should not accept int for dsc_skippendingfilerename' do
    expect{dsc_xpendingreboot[:dsc_skippendingfilerename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skippendingfilerename' do
    expect{dsc_xpendingreboot[:dsc_skippendingfilerename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pendingfilerename' do
    expect{dsc_xpendingreboot[:dsc_pendingfilerename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_pendingfilerename' do
    dsc_xpendingreboot[:dsc_pendingfilerename] = true
    expect(dsc_xpendingreboot[:dsc_pendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_pendingfilerename" do
    dsc_xpendingreboot[:dsc_pendingfilerename] = 'true'
    expect(dsc_xpendingreboot[:dsc_pendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_pendingfilerename" do
    dsc_xpendingreboot[:dsc_pendingfilerename] = 'false'
    expect(dsc_xpendingreboot[:dsc_pendingfilerename]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_pendingfilerename" do
    dsc_xpendingreboot[:dsc_pendingfilerename] = 'True'
    expect(dsc_xpendingreboot[:dsc_pendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_pendingfilerename" do
    dsc_xpendingreboot[:dsc_pendingfilerename] = 'False'
    expect(dsc_xpendingreboot[:dsc_pendingfilerename]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_pendingfilerename" do
    dsc_xpendingreboot[:dsc_pendingfilerename] = :true
    expect(dsc_xpendingreboot[:dsc_pendingfilerename]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_pendingfilerename" do
    dsc_xpendingreboot[:dsc_pendingfilerename] = :false
    expect(dsc_xpendingreboot[:dsc_pendingfilerename]).to eq(false)
  end

  it 'should not accept int for dsc_pendingfilerename' do
    expect{dsc_xpendingreboot[:dsc_pendingfilerename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pendingfilerename' do
    expect{dsc_xpendingreboot[:dsc_pendingfilerename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skippendingcomputerrename' do
    expect{dsc_xpendingreboot[:dsc_skippendingcomputerrename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skippendingcomputerrename' do
    dsc_xpendingreboot[:dsc_skippendingcomputerrename] = true
    expect(dsc_xpendingreboot[:dsc_skippendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skippendingcomputerrename" do
    dsc_xpendingreboot[:dsc_skippendingcomputerrename] = 'true'
    expect(dsc_xpendingreboot[:dsc_skippendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skippendingcomputerrename" do
    dsc_xpendingreboot[:dsc_skippendingcomputerrename] = 'false'
    expect(dsc_xpendingreboot[:dsc_skippendingcomputerrename]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skippendingcomputerrename" do
    dsc_xpendingreboot[:dsc_skippendingcomputerrename] = 'True'
    expect(dsc_xpendingreboot[:dsc_skippendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skippendingcomputerrename" do
    dsc_xpendingreboot[:dsc_skippendingcomputerrename] = 'False'
    expect(dsc_xpendingreboot[:dsc_skippendingcomputerrename]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skippendingcomputerrename" do
    dsc_xpendingreboot[:dsc_skippendingcomputerrename] = :true
    expect(dsc_xpendingreboot[:dsc_skippendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skippendingcomputerrename" do
    dsc_xpendingreboot[:dsc_skippendingcomputerrename] = :false
    expect(dsc_xpendingreboot[:dsc_skippendingcomputerrename]).to eq(false)
  end

  it 'should not accept int for dsc_skippendingcomputerrename' do
    expect{dsc_xpendingreboot[:dsc_skippendingcomputerrename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skippendingcomputerrename' do
    expect{dsc_xpendingreboot[:dsc_skippendingcomputerrename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_pendingcomputerrename' do
    expect{dsc_xpendingreboot[:dsc_pendingcomputerrename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_pendingcomputerrename' do
    dsc_xpendingreboot[:dsc_pendingcomputerrename] = true
    expect(dsc_xpendingreboot[:dsc_pendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_pendingcomputerrename" do
    dsc_xpendingreboot[:dsc_pendingcomputerrename] = 'true'
    expect(dsc_xpendingreboot[:dsc_pendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_pendingcomputerrename" do
    dsc_xpendingreboot[:dsc_pendingcomputerrename] = 'false'
    expect(dsc_xpendingreboot[:dsc_pendingcomputerrename]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_pendingcomputerrename" do
    dsc_xpendingreboot[:dsc_pendingcomputerrename] = 'True'
    expect(dsc_xpendingreboot[:dsc_pendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_pendingcomputerrename" do
    dsc_xpendingreboot[:dsc_pendingcomputerrename] = 'False'
    expect(dsc_xpendingreboot[:dsc_pendingcomputerrename]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_pendingcomputerrename" do
    dsc_xpendingreboot[:dsc_pendingcomputerrename] = :true
    expect(dsc_xpendingreboot[:dsc_pendingcomputerrename]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_pendingcomputerrename" do
    dsc_xpendingreboot[:dsc_pendingcomputerrename] = :false
    expect(dsc_xpendingreboot[:dsc_pendingcomputerrename]).to eq(false)
  end

  it 'should not accept int for dsc_pendingcomputerrename' do
    expect{dsc_xpendingreboot[:dsc_pendingcomputerrename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pendingcomputerrename' do
    expect{dsc_xpendingreboot[:dsc_pendingcomputerrename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_skipccmclientsdk' do
    expect{dsc_xpendingreboot[:dsc_skipccmclientsdk] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_skipccmclientsdk' do
    dsc_xpendingreboot[:dsc_skipccmclientsdk] = true
    expect(dsc_xpendingreboot[:dsc_skipccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_skipccmclientsdk" do
    dsc_xpendingreboot[:dsc_skipccmclientsdk] = 'true'
    expect(dsc_xpendingreboot[:dsc_skipccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_skipccmclientsdk" do
    dsc_xpendingreboot[:dsc_skipccmclientsdk] = 'false'
    expect(dsc_xpendingreboot[:dsc_skipccmclientsdk]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_skipccmclientsdk" do
    dsc_xpendingreboot[:dsc_skipccmclientsdk] = 'True'
    expect(dsc_xpendingreboot[:dsc_skipccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_skipccmclientsdk" do
    dsc_xpendingreboot[:dsc_skipccmclientsdk] = 'False'
    expect(dsc_xpendingreboot[:dsc_skipccmclientsdk]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_skipccmclientsdk" do
    dsc_xpendingreboot[:dsc_skipccmclientsdk] = :true
    expect(dsc_xpendingreboot[:dsc_skipccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_skipccmclientsdk" do
    dsc_xpendingreboot[:dsc_skipccmclientsdk] = :false
    expect(dsc_xpendingreboot[:dsc_skipccmclientsdk]).to eq(false)
  end

  it 'should not accept int for dsc_skipccmclientsdk' do
    expect{dsc_xpendingreboot[:dsc_skipccmclientsdk] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_skipccmclientsdk' do
    expect{dsc_xpendingreboot[:dsc_skipccmclientsdk] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ccmclientsdk' do
    expect{dsc_xpendingreboot[:dsc_ccmclientsdk] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_ccmclientsdk' do
    dsc_xpendingreboot[:dsc_ccmclientsdk] = true
    expect(dsc_xpendingreboot[:dsc_ccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_ccmclientsdk" do
    dsc_xpendingreboot[:dsc_ccmclientsdk] = 'true'
    expect(dsc_xpendingreboot[:dsc_ccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_ccmclientsdk" do
    dsc_xpendingreboot[:dsc_ccmclientsdk] = 'false'
    expect(dsc_xpendingreboot[:dsc_ccmclientsdk]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_ccmclientsdk" do
    dsc_xpendingreboot[:dsc_ccmclientsdk] = 'True'
    expect(dsc_xpendingreboot[:dsc_ccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_ccmclientsdk" do
    dsc_xpendingreboot[:dsc_ccmclientsdk] = 'False'
    expect(dsc_xpendingreboot[:dsc_ccmclientsdk]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_ccmclientsdk" do
    dsc_xpendingreboot[:dsc_ccmclientsdk] = :true
    expect(dsc_xpendingreboot[:dsc_ccmclientsdk]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_ccmclientsdk" do
    dsc_xpendingreboot[:dsc_ccmclientsdk] = :false
    expect(dsc_xpendingreboot[:dsc_ccmclientsdk]).to eq(false)
  end

  it 'should not accept int for dsc_ccmclientsdk' do
    expect{dsc_xpendingreboot[:dsc_ccmclientsdk] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ccmclientsdk' do
    expect{dsc_xpendingreboot[:dsc_ccmclientsdk] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xpendingreboot)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xpendingreboot)
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
