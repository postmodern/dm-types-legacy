require 'spec_helper'
require 'helpers/property'

require 'dm-core/property/legacy/numeric_ip_addr'

describe DataMapper::Property::Legacy::NumericIPAddr do
  include Helpers::Property

  before(:all) do
    property(DataMapper::Property::Legacy::NumericIPAddr)
  end

  let(:ip_string) { '127.0.0.1' }
  let(:ip) { IPAddr.new(ip_string) }
  let(:ip_number) { ip.to_i }

  describe "load" do
    it "should load numeric IP Addresses" do
      @property.load(ip_number).should == ip
    end

    it "should not load nil" do
      @property.load(nil).should be_nil
    end
  end

  describe "typecast" do
    it "should cast IPAddr objects" do
      @property.typecast(ip).should == ip
    end

    it "should cast String objects" do
      @property.typecast(ip_string).should == ip
    end

    it "should cast Integer objects" do
      @property.typecast(ip_number).should == ip
    end

    it "should not cast negative numbers" do
      @property.typecast(-1).should == nil
    end

    it "should not cast empty-strings" do
      @property.typecast('').should be_nil
    end

    it "should not cast nil" do
      @property.typecast(nil).should be_nil
    end
  end

  describe "dump" do
    it "should dump an IPAddr object" do
      @property.dump(ip).should == ip_number
    end

    it "should not dump nil" do
      @property.dump(nil).should be_nil
    end
  end
end
