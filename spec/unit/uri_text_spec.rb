require 'spec_helper'
require 'helpers/property'

require 'dm-core/property/legacy/uri_text'

describe DataMapper::Property::Legacy::URIText do
  include Helpers::Property

  before(:all) do
    property(DataMapper::Property::Legacy::URIText)
  end

  let(:raw_text) { 'one two' }
  let(:uri_text) { 'one%20two' }

  describe "load" do
    it "should load Date Strings" do
      @property.load(uri_text).should == raw_text
    end

    it "should not load empty-strings" do
      @property.load('').should be_empty
    end

    it "should not load nil" do
      @property.load(nil).should be_nil
    end
  end

  describe "dump" do
    it "should dump raw text" do
      @property.dump(raw_text).should == uri_text
    end

    it "should not dump nil" do
      @property.dump(nil).should be_nil
    end
  end
end
