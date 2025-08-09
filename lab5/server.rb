require 'socket'

require '../lab4/oop'

server = TCPServer.open('0.0.0.0', 3000)

cash = CashMachine.new
while connection = server.accept
  request = connection.gets
  method, address, protocol = request.split(' ')
  path, params = address.split('?')

  name_param, ent_param = params.split('=')
  status = "200"
  
  case path
  when '/deposit'
    cash.balance += ent_param.to_i
    response = "Add #{ent_param}. Res #{cash.balance}"
  when '/withdraw'
    cash.balance -= ent_param.to_i
    response = "Minus #{ent_param}. Res #{cash.balance}"
  when '/balance'
    response = cash.balance
  end

 
  connection.print "HTTP/1.1 #{status}\r\n"
  connection.print "Content-Type: text/plain\r\n"
  connection.print "Connection: close\r\n"
  connection.print "\r\n"
  connection.print response
end