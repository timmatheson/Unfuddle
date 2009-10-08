require File.dirname(__FILE__) + "/../../spec_helper.rb"
describe Unfuddle::Project, " a valid project" do
  before(:each) do
    @project = Unfuddle::Project.find(:first)
  end
  
  it "should return the project tickets" do
    @project.tickets.class.should == Array
  end
  
  it "should have an account id" do
    @project.account_id.should_not be_nil
  end
  
  it "should have an archived attribute" do
    @project.archived.should_not be_nil
  end
  
  it "should have an 'assignee on resolve' attribute" do
    @project.assignee_on_resolve.should_not be_nil
  end
  
  it "should have one of reporter, none, nochange value for 'assignee on resolve'" do
    ["reporter","none","nochange"].include?(@project.assignee_on_resolve).should == true
  end
end