
# gdAPI_tst | stencylxd 2020
# Get information about any level in GD.

ID = 56842275  # Set this to GD Level ID. (you can get one at gdbrowser.com)

require "net/http"; require "json"; res = Net::HTTP.get(URI("https://gdbrowser.com/api/level/" + ID.to_s))
res = JSON.parse(res); res.each { |opt, val| puts opt + ": " + val.to_s + "\n\n" }
