
# run_away | stencylxd 2020

tick = 0; jumpin = false; start = true; key = ""; en = []; $ob = []; ekey = nil; tick2 = 0; hit = 0
public; def bgen; @q = nil; until @q == 550 || @q == 500 || @q == 450 || @q == 400; @q = rand(400..550); end; return @q; end
def summonOb; if rand(0..1) == 1; @obx = rand(0..$p1.x); else; @obx = rand(1000..$p1.x); end
$ob.push(Square.new(size: 80, y: 270, x: @obx, color: "blue", z: -1)); end
require "ruby2d"; set background: "black", title: "run_away", width: 1000, height: 600
  $p1 = Rectangle.new(x: 450, y: 270, height: 75, width: 50, color: "red", z: -2)
  hits = Text.new("Times hit: " + hit.to_s, y: 20, color: "white"); nume = Text.new("Times hit: " + $ob.length.to_s, y: 20, color: "white")
  on :key_down do |e|; ekey = e.key; summonOb if ekey.downcase == "e"; end
on :key_held do |e|; if e.key == "space"; jumpin = true; else; key = e.key; end; end; update do; case key.downcase
when "a"; $p1.x -= 7; when "d"; $p1.x += 7; end; if jumpin == true; if tick < 40; if tick < 20; $p1.y -= 8; else
  $p1.y += 8; end; tick += 1; else; jumpin = false; tick = 0; end; end; if start == true
      clear; 2.times { blo = []; blob = []; bls = []; blsb = []; bld = []; tmb = []
      Text.new("Press E to summon EVIL thingymbob", color: "white"); tmpc = -100; tmpb = 0; tmp = -100; 19.times { tmb.push(bgen) }
      tmb.each { |dat| blo.push(Square.new(y: dat, x: (tmp += 100), color: "brown", z: 3)) }
      tmp = 0; 19.times { tmpb = bgen; until tmpb != tmb[tmp]; tmpb = bgen; end; blsb.push(tmpb)
      tmp += 1; bls.push(Square.new(color: "gray", y: tmpb, x: (tmpc += 100), z: 3)) }; bldb = []; tmpc = 0
      tmp = 0; 19.times { tmpb = bgen; until tmpb != (tmb[tmp] && blsb[tmp]); tmpb = bgen; end; bldb.push(tmpb)
      tmp += 1; bld.push(Square.new(color: "white", y: tmpb, x: (tmpc += 100), z: 3))}; tmp = -100; tmpb = nil }
      Rectangle.new(color: "brown", y: 380, height: 50, width: 1000, z: 0)
      Rectangle.new(color: "green", y: 345, height: 35, width: 1000, z: 4); $p1.add; hits.add; $p1.x = 450; start = false; end
      if start == false; hits.remove; hits = Text.new("Times hit: " + hit.to_s, y: 20, color: "white"); hits.add; end
      if start == false; nume.remove; nume = Text.new("Things rendered: " + $ob.length.to_s, y: 40, color: "white"); nume.add; end
      $ob.each { |obt| hit += 1 if $p1.contains?(obt.x, obt.y)
        case rand(0..10); when 0; when 1; obt.x -= 6; when 2; obt.x -= 9; when 3; obt.x += 6
        when 4; obt.x += 9; when (5 || 6 || 7 || 8 || 9 || 10); obt.x += 10 if obt.x < $p1.x; obt.x -= 10 if obt.x > $p1.x; end }
      $p1.x = 0 if $p1.x > 1000; $p1.x = 1000 if $p1.x < 0; key = ""; end; show
