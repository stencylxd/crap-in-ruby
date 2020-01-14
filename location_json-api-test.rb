
#loc_api_tst | stencylxd 2020

require 'net/http'; require "json"; res = Net::HTTP.get(URI("https://api.myip.com"))
res = JSON.parse(res); puts "You live in: " + res["country"].to_s
puts "Your IP is: " + res["ip"].to_s
