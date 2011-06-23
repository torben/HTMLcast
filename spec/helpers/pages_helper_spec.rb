require 'spec_helper'

describe PagesHelper do
  context "#page_link" do
    # it "should return a URL to a page via permalink if a page with the given identifier exists" do
    #   Page.make!(:identifier => 'foo', :permalink => 'foobar')
    #   helper.page_link(:foo).should == '/pages/foobar'
    # end

    it "should return a URL to a page via identifier if a page with the given identifier exists" do
      Page.make!(:identifier => 'foo', :permalink => 'foobar')
      helper.page_link(:foo).should == '/pages/foo'
    end

    it "should return a URL to a page via identifier if no page with the given identifier exists" do
      helper.page_link(:foo).should == '/pages/foo'
    end

    # it "should return a full URL to a page via permalink if a page with the given identifier exists and :only_path => false is given" do
    #   Page.make!(:identifier => 'foo', :permalink => 'foobar')
    #   helper.page_link(:foo, :only_path => false).should == 'http://test.host/pages/foobar'
    # end

    it "should return a full URL to a page via identifier if a page with the given identifier exists and :only_path => false is given" do
      Page.make!(:identifier => 'foo', :permalink => 'foobar')
      helper.page_link(:foo, :only_path => false).should == 'http://test.host/pages/foo'
    end

    it "should return a full URL to a page via identifier if no page with the given identifier exists and :only_path => false is given" do
      helper.page_link(:foo, :only_path => false).should == 'http://test.host/pages/foo'
    end
  end
end