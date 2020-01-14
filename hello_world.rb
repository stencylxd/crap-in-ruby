
# First ruby program I ever made. (compacted)
# hello_world.rb | stencylxd 2019

answer = nil; puts "Hello World"; until (answer == "y") do; print "Enter your name: "
name = gets.to_s; answer = nil; until (answer == "y" or answer == "n") do
puts nil; print "Is " + name.chomp + " your name? (y/n): "; answer = gets.chomp
end; if (answer == "y"); puts "Yay!"; else (answer == "n"); puts "Sorry!"
end; end; until false; puts name.chomp + " is awesome."; end
