
# telnet_random_number || stencylxd 2020

# To run >>
# Run 'telnet localhost 8080' in a terminal with telnet.
# Boom. Random number.

require 'socket'; socket = TCPServer.new('localhost', 8080)
puts "Generating on port 8080. Press CTRL+C to cancel."; loop do; client = socket.accept
Thread.new { client.write("Your number is: " + rand(0..1000000).to_s + "\n\n"); client.close; }; end
