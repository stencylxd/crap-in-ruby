
# endless_zombies | stencylxd 2020

tick = 0; jumpin = false; start = true; key = ""; nume = 0; en = []
def bgen; @q = nil; until @q == 550 || @q == 500 || @q == 450 || @q == 400; @q = rand(400..550); end; return @q; end
require "ruby2d"; set background: "black", title: "endless_zombies", width: 1000, height: 600
  p1 = Rectangle.new(x: 450, y: 270, height: 75, width: 50, color: "red", z: 4)
on :key_held do |e|; if e.key == "space"; jumpin = true; else; key = e.key; end; end; update do; case key
  when "a"; p1.x -= 4; when "d"; p1.x += 4; end; if jumpin == true; if tick < 40; if tick < 20; p1.y -= 6; else
  p1.y += 6; end; tick += 1; else; jumpin = false; tick = 0; end; end; if start == true
      clear; 2.times { blo = []; blob = []; bls = []; blsb = []; bld = []; tmb = []
      tmpc = -100; tmpb = 0; tmp = -100; 19.times { tmb.push(bgen) }
      tmb.each { |dat| blo.push(Square.new(y: dat, x: (tmp += 100), color: "brown", z: 3)) }
      tmp = 0; 19.times { tmpb = bgen; until tmpb != tmb[tmp]; tmpb = bgen; end; blsb.push(tmpb)
      tmp += 1; bls.push(Square.new(color: "gray", y: tmpb, x: (tmpc += 100), z: 3)) }; bldb = []; tmpc = 0
      tmp = 0; 19.times { tmpb = bgen; until tmpb != (tmb[tmp] && blsb[tmp]); tmpb = bgen; end; bldb.push(tmpb)
      tmp += 1; bld.push(Square.new(color: "white", y: tmpb, x: (tmpc += 100), z: 3))}; tmp = -100; tmpb = nil }
      Rectangle.new(color: "brown", y: 380, height: 50, width: 1000, z: 0)
      Rectangle.new(color: "green", y: 345, height: 35, width: 1000, z: 4); p1.add
      p1.x = 450 if start == true; start = false if start == true; end
      puts "AfterFrameKey: " + key.to_s unless key == ""
      puts "AfterFrameKey: none" if key == ""; puts "CurrentlyJumping: " + jumpin.to_s
      puts "ConflictsRenderedIn: " + nume.to_s + "\n\n\n"; key = ""; end; show
