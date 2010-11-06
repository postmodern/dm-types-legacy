require 'spec_helper'
require 'helpers/property'

require 'dm-core/property/legacy/html_text'

describe DataMapper::Property::Legacy::HTMLText do
  include Helpers::Property

  before(:all) do
    property(DataMapper::Property::Legacy::HTMLText)
  end

  let(:raw_text) { 'one & two' }
  let(:html_text) { 'one &amp; two' }

  describe "load" do
    it "should load Date Strings" do
      @property.load(html_text).should == raw_text
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
      @property.dump(raw_text).should == html_text
    end

    it "should not dump nil" do
      @property.dump(nil).should be_nil
    end
  end
end
