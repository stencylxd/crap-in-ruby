
 # randdom cube gen with ruby2d by stencylxd
 require "ruby2d"
 set title: "Random Shape Gen"
temp = 0

 def random(from=1, to=100)
   num = rand(from..to)
   return num
 end

update do
    b1 = Square.new(color: "random", x: random(1, 575), y: random(1, 435), size: 30, z: random(0, 5))
    b2 = Circle.new(color: "random", x: random(1, 575), y: random(1, 435), size: 30, z: random(0, 5))
    b3 = Square.new(color: "random", x: random(1, 575), y: random(1, 435), size: 30, z: random(0, 5))
    temp += 1
    if temp > 50 then
      clear
      temp = 0
      set background: "random"
    end
end
show
