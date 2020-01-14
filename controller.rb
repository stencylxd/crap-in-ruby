
# Controller.rb | stencylxd 2020

require "ruby2d"; button = nil; set title: "Controller", background: "navy"
p1 = Square.new(color: "red", size: 50, x: 50, y: 50)
on :controller do |event|; button = event.button; end; update do
  case button; when :up; p1.y -= 4; when :down; p1.y += 4
  when :left; p1.x -= 4; when :right; p1.x += 4; end; end; show
