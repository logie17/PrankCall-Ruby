class PrankCall
  VERSION = '0.0.1'
  require 'socket'

  def initialize(params)
    @host = params[:host]
    @port = params[:port]

  end

  def get(params)
    query_params = URI::encode_www_form(params[:params]) 
    TCPSocket.open(@host,@port).print("GET #{params[:path]}?#{query_params} HTTP/1.1\nHost: 127.0.0.1\nUser-Agent: $user_agent\nContent-Type: application/x-www-form-urlencoded\n\n")
    1
  end

end

