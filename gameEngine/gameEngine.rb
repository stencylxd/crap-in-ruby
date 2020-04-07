
# game engine? | stencylxd 2020

# Variables (Simple game settings):
$p1 = nil # Main RUBY2D Rectangle character
$title = "Game Engine" # Set the title of window
# Used for stuff in code
$paused = false
$running = false
$jumping = false
$canRun = true # Set to false to make player not run
$canJump = true # Set to false to make player not jump
# Variables (Gameplay affect):
$walkingSpeed = 4 # How fast you walk
$runningSpeed = 6 # How fast you run
$jumpHeight = 3 # Jumping height
# Kinda useless Variables (i would leave at default)
$tmpHeight = nil
$tmpHeightGen = false
$runningColor = "olive"
$walkingColor = "blue"

def rndHeight(sndOff = rand(0.2..0.5)); unless $jumpHeight <= sndOff; if rand(0..1) == 1
ret = ($jumpHeight - sndOff); else; ret = ($jumpHeight + sndOff); end; return ret; else
raise "Variable jumpHeight is less or equal to given number. (rndHeight function)"; end; end
tick = 0; jumpin = false; $start = true; en = []; $ob = []; ekey = nil; tick2 = 0; hit = 0
public; def bgen; @q = nil; until @q == 550 || @q == 500 || @q == 450 || @q == 400; @q = rand(400..550); end; return @q; end
require "ruby2d"; set background: "black", title: $title, width: 1000, height: 600
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
elsif e.key == "space"; $jumping = true; else; $p1.x += $playerSpeed if e.key.downcase == "d"
  $p1.x -= $playerSpeed if e.key.downcase == "a" # Player lockup if A and D are pressed at same time.
$running = false; end; end; end; on :key_down do |e| # Put keyDown detections here.

  case e.key; when "escape"; if $paused == true; $paused = false
  else $paused = false; $paused = true; end; pauseGame; end

end; # End of keyDown definitions.
update do; reloadMap if $start == true; if $jumping == true && $canJump == true && $paused == false
if $tmpHeightGen == false; $tmpHeight = rndHeight; $tmpHeightGen = true; end; if tick < 40
if tick < 20; $p1.y -= $tmpHeight; else; $p1.y += $tmpHeight; end; tick += 1
else; $jumping = false; tick = 0; $tmpHeightGen = false; end; end
  if $running == true && $canRun == true; $playerSpeed = $runningSpeed; $p1.color = $runningColor
  else; $playerSpeed = $walkingSpeed; $p1.color = $walkingColor; end
  if $p1.x > 1000; reloadMap; $p1.x = 0; elsif $p1.x < 0; $p1.x = 1000; reloadMap end
  $p1.x = 270 if $canJump == false # Player will teleport back to ground if canJump = false
  # Put game code here: (per frame update)

   if $paused == false; key = ""; $running = false; end; end; show # End game code.
