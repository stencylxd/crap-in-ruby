
# Binary Generator by stencylxd

n1 = 0
n2 = 1
puts "'BinaryGenerator' thingy"
puts "What numbers do you like? (seperate by spaces)"
print ">> "
n3 = gets.chomp.to_s
n3 = n3.split(" ")
n1 = n3[0].to_i unless n3[0] == nil
n2 = n3[1].to_i unless n3[1] == nil
while true
  print rand(n1..n2) unless n1 > n2
  print rand(n2..n1) unless n2 > n1
end
