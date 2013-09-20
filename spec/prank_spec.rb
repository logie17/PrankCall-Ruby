require 'spec_helper'
describe PrankCall do
  it "Should do a basic GET request" do
    prank = PrankCall.new(:host => 'http://127.0.0.1', :port => 3450 )
    expect(prank).to be_an_instance_of(PrankCall)
  end
end
