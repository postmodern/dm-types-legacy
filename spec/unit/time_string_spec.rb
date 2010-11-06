require 'spec_helper'
require 'helpers/property'

require 'dm-core/property/legacy/time_string'

describe DataMapper::Property::Legacy::TimeString do
  include Helpers::Property

  before(:all) do
    property(DataMapper::Property::Legacy::TimeString)
  end

  let(:time_string) { '2010-11-05 00:00:00 -0700' }
  let(:time) { Time.parse(time_string) }
  let(:date) { Date.parse(time_string) }

  describe "load" do
    it "should load Time strings" do
      @property.load(time_string).should == time
    end

    it "should load Date strings" do
      @property.load(time_string).should == time
    end

    it "should not load empty-strings" do
      @property.load('').should be_nil
    end

    it "should not load nil" do
      @property.load(nil).should be_nil
    end
  end

  describe "typecast" do
    it "should cast Time objects" do
      @property.typecast(time).should == time
    end

    it "should cast Date objects" do
      @property.typecast(date).should == time
    end

    it "should cast String objects" do
      @property.typecast(time_string).should == time
    end

    it "should not cast empty-strings" do
      @property.typecast('').should be_nil
    end

    it "should not cast nil" do
      @property.typecast(nil).should be_nil
    end
  end

  describe "dump" do
  end
end
