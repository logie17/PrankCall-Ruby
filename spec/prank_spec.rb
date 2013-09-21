require 'spec_helper'
describe PrankCall do
  it "Should do a basic GET request" do
    open_params = []
    require 'socket'
    class TCPSocket;end
    TCPSocket.class_eval { define_method(:open) { |*params| open_params.push[*params] } }

    prank = PrankCall.new(:host => '127.0.0.1', :port => 3450 )
    expect(prank).to be_an_instance_of(PrankCall)

    expect(prank.get(:path => '/', :params => { 'foo' => 'bar' })).to eq 1
    expect(open_params[0]).to eq '127.0.0.1'
    expect(open_params[1]).to eq 3450


  end
end
