require File.dirname(__FILE__) + "/../../spec_helper.rb"
describe Unfuddle::Account, " a valid account" do
  it "should return the current account" do
    Unfuddle::Account.current.should_not be_nil
  end
  
  it "should return the access key" do
    account = Unfuddle::Account.current
    account.access_key.should_not be_nil
  end
end