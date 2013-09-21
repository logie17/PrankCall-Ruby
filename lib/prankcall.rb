class PrankCall
  VERSION = '0.0.1'
  require 'socket'

  def initialize(params)
    @host = params[:host]
    @port = params[:port]
  end

  def get(params)
    TCPSocket.open(@host,@port)
    1
  end

end

