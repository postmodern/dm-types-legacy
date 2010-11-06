require 'spec_helper'
require 'helpers/property'

require 'dm-core/property/legacy/date_string'

describe DataMapper::Property::Legacy::DateString do
  include Helpers::Property

  before(:all) do
    property(DataMapper::Property::Legacy::DateString)
  end

  let(:date_string) { '2010-11-05' }
  let(:time) { Time.parse(date_string) }
  let(:date) { Date.parse(date_string) }

  describe "load" do
    it "should load Date Strings" do
      @property.load(date_string).should == date
    end

    it "should not load empty-strings" do
      @property.load('').should be_nil
    end

    it "should not load nil" do
      @property.load(nil).should be_nil
    end
  end

  describe "typecast" do
    it "should cast Date objects" do
      @property.typecast(date).should == date
    end

    it "should cast Time objects" do
      @property.typecast(time).should == date
    end

    it "should cast String objects" do
      @property.typecast(date_string).should == date
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
