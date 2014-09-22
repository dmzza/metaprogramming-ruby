#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
# encoding: UTF-8
require 'spec_helper'

describe Ghee do
  it "should have a VERSION constant" do
    Ghee.const_defined?('VERSION').should be_true
  end

  describe "factory methods" do 
    context "with token" do
      it "should set up a connection" do 
        gh = Ghee.access_token "ABC123"
        gh.connection.should be_instance_of(Ghee::Connection)
        gh.connection.hash.should == {:access_token => "ABC123"}
      end
    end
    context "with basic auth" do
      it "should set up a connection" do 
        gh = Ghee.basic_auth("herp","derp")
        gh.connection.should be_instance_of(Ghee::Connection)
        gh.connection.hash.should == {:basic_auth => {:user_name => "herp", :password => "derp"}}
      end
    end
  end
  describe "#initialize" do
    context "with an access_token" do
      it "should set up a connection" do
        gh = Ghee.new(GH_AUTH)
        gh.connection.should be_instance_of(Ghee::Connection)
        gh.connection.hash.should == GH_AUTH
      end
    end

    context "without an access_token" do
      it "should set up a connection" do
        gh = Ghee.new
        gh.connection.should be_instance_of(Ghee::Connection)
      end
    end
  end
end
