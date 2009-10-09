require File.dirname(__FILE__) + "/../../spec_helper.rb"
describe Unfuddle::Ticket, " a valid ticket" do
  before(:each) do
    @project = Unfuddle::Project.find(:first)
  end
  
  it "should find a ticket" do
    ticket = @project.tickets.first
    ticket.should.class == Unfuddle::Ticket
  end
  
  it "should create a ticket" do
    ticket = @project.tickets.create(:description => "test driven ticket")
    ticket.should == ""
  end
end