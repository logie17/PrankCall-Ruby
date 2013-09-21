require 'spec_helper'
describe PrankCall do
  it "Should do a basic GET request" do
    open_params = []
    print_params = []
    require 'socket'
    class TCPSocket;end
    class MockSocket;end
    MockSocket.class_eval { define_method('print'){|*params| print_params.push(params) }}
    TCPSocket.singleton_class.class_eval { define_method('open'){|*params| open_params.push(params); MockSocket.new }}

    prank = PrankCall.new(:host => '127.0.0.1', :port => 3450 )
    expect(prank).to be_an_instance_of(PrankCall)
    expect(prank.get(:path => '/', :params => { 'foo' => 'bar' })).to eq 1
    expect(open_params[0]).to eq ["127.0.0.1", 3450]
    expect(print_params).to eq [["GET /?foo=bar HTTP/1.1\nHost: 127.0.0.1\nUser-Agent: $user_agent\nContent-Type: application/x-www-form-urlencoded\n\n"]]
  end
end
