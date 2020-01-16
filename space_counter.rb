
# spacebar counter @stencylxd
require "ruby2d"
set background: "navy", title: "spacebar counter", width: 1000, height: 600
count = 0; key = "space"; a1 = 0; z1 = 11
sub = false; on :key_down do |event|
  if event.key == key
    count += 1 unless sub == true; count -= 1 unless sub == false
  elsif event.key == "escape"; count = 0
  elsif event.key.downcase == "s"; case sub
  when true; sub = false; when false; sub = true; end; else
    if event.key.to_i != a1..z1 # a1 and z1 being 0 10
      count += event.key.to_i unless sub == true
      count -= event.key.to_i unless sub == false
    else; key = event.key.downcase; end; end; end; update do; clear
  Text.new("You pressed space " + count.to_s + " times.", color: "white")
  Text.new("Press Escape to clear the count.", y: 560, color: "white")
  Text.new("Press S to enable Subtract mode. (#{sub})", y: 540, color: "white") if sub == false
  Text.new("Press S to disable Subtract mode. (#{sub})", y: 540, color: "white") if sub == true
  Text.new("Press a number to (add) to the count.", y: 520, color: "white") if sub == false
  Text.new("Press a number to (subtract) from the count.", y: 520, color: "white") if sub == true
  Text.new("Press a letter or modifier key to make that the #{key} button.", y: 500, color: "white")
end; show
