
# Inventory System | stencylxd 2019

inv = {
  1 => "Apple",
  2 => "Map",
  3 => "Sword"
}

while true
  puts nil
  puts "What slot?"
  print ">>"
  choice = gets.chomp.to_i
  if choice <= 3
    puts inv[choice]
  end
end
