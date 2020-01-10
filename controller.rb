
require "ruby2d"

# Controller.rb | stencylxd 2020

axis = nil; set title: "Controller", background: "navy"
p1 = Square.new(color: "red", size: 50, x: 50, y: 50)
on :controller do |event|; axis = event.axis; end; update do
  case axis; when :up; p1.y -= 4; when :down; p1.y += 4
  when :left; p1.x -= 4; when :right; p1.x += 4; end; end; show
