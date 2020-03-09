
# Survival Documentary | stencylxd 2020

# Variables:
$paused = false
$canJump = true
$jumpSpeed = 6
$canRun = true
$playerSpeed = 6
$running = false

tick = 0; jumpin = false; $start = true; en = []; $ob = []; ekey = nil; tick2 = 0; hit = 0
public; def bgen; @q = nil; until @q == 550 || @q == 500 || @q == 450 || @q == 400; @q = rand(400..550); end; return @q; end
require "ruby2d"; set background: "black", title: "Survival Documentary", width: 1000, height: 600
 def pauseGame; $pauseMessage = Text.new("The game is not paused, press escape to continue.", x: 160, size: 30, y: 100,
    color: "white", z: 10000000); if $paused == false; clear; reloadMap; end; end; $speed = 3
   def reloadMap; clear; 2.times { blo = []; blob = []; bls = []; blsb = []; bld = []; tmb = []
    tmpc = -100; tmpb = 0; tmp = -100; 19.times { tmb.push(bgen) }
    tmb.each { |dat| blo.push(Square.new(y: dat, x: (tmp += 100), color: "brown", z: 3)) }
    tmp = 0; 19.times { tmpb = bgen; until tmpb != tmb[tmp]; tmpb = bgen; end; blsb.push(tmpb)
    tmp += 1; bls.push(Square.new(color: "gray", y: tmpb, x: (tmpc += 100), z: 3)) }; bldb = []; tmpc = 0
    tmp = 0; 19.times { tmpb = bgen; until tmpb != (tmb[tmp] && blsb[tmp]); tmpb = bgen; end; bldb.push(tmpb)
    tmp += 1; bld.push(Square.new(color: "white", y: tmpb, x: (tmpc += 100), z: 3))}; tmp = -100; tmpb = nil }
    Rectangle.new(color: "brown", y: 380, height: 50, width: 1000, z: 0)
    Rectangle.new(color: "green", y: 345, height: 35, width: 1000, z: 4); $p1.add; $start = false; end
  $p1 = Rectangle.new(x: 450, y: 270, height: 75, width: 50, color: "blue", z: -2)
on :key_held do |e|; unless $paused == true; if e.key == "left shift"; $running = true
elsif e.key == "space"; jumpin = true; else; $p1.x += $playerSpeed if e.key.downcase == "d"
  $p1.x -= $playerSpeed if e.key.downcase == "a" # Player lockup if A and D are pressed at same time.
$running = false; end; end; end; on :key_down do |e| # Put keyDown detections here.

  case e.key; when "escape"; if $paused == true
    $paused = false; else $paused = false; $paused = true; end; pauseGame
  end

end; # End of keyDown definitions.
update do; reloadMap if $start == true;
if jumpin == true && $canJump == true && $paused == false
if tick < 40; if tick < 20; $p1.y -= $jumpSpeed; else
  $p1.y += $jumpSpeed; end; tick += 1; else; jumpin = false; tick = 0; end; end
  if $running == true && $canRun == true; $playerSpeed = 8; $p1.color = "olive"
  else; $playerSpeed = 6; $p1.color = "blue"; end
  if $p1.x > 1000; reloadMap; $p1.x = 0; elsif $p1.x < 0; $p1.x = 1000; reloadMap end
  # Put game code here:
  # $canJump: Boolean that states if the player can jump.
  # reloadMap: Function that reloads the map.
  # pauseGame: Function that pauses game based on $paused value.
  # $paused: Variable that is used to pause and unpause game.
  # $jumpSpeed: Jump speed on way up and down.
  # $canRun: Boolean that says if the player can run or not.
  # $running: Boolean that says if the player is running.

   if $paused == false; key = ""; $running = false; end; end; show # End game code.
