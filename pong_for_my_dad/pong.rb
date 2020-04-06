
# pong, but for my dad | stencylxd 2020

require "ruby2d"; set width: 1000, height: 600, title: "Pong!"
$song = Music.new('my plea.wav'); $song.loop = true; $song.play
$ballDirection = :none; $start = false; $rmed = 3;
$scr1 = 0; $scr2 = 0; $startB = false
$diff = :impossible; $paused = true
$s1 = Text.new($scr1.to_s, color: "red", size: 40, x: 8, y: 5); $s1.remove
$right = Rectangle.new(color: "blue", x: 940, y: 250, height: 100, width: 10); $right.remove
$p1 = Rectangle.new(color: "red", x: 60, y: 250, height: 100, width: 10); $p1.remove
def startGame(tmp = false, oth = false); clear; $b = Square.new(color: "white", size: 25, x: 475, y: 277)
  if tmp; $p1.y = 250; $right.y = 250; $scr1 = 0; $scr2 = 0; end
  if oth; $rmed = 3; $rmedB = 3; $p1.y = 250; $right.y = 250; end
  $s1 = Text.new($scr1.to_s, color: "red", size: 40, x: 8, y: 5);
  $p1.y = 250 if !$startB; if $diff != :impossible; $s1.add; else; $s1.remove; end
  $s2 = Text.new($scr2.to_s, color: "blue", size: 40, x: 970, y: 5)
  $start = false; $startB = true; $ballDirection == false; case rand(0..3); when 0
      $ballDirection = :leftdown; when 1
      $ballDirection = :leftup; when 2
      $ballDirection = :rightdown; when 3
      $ballDirection = :rightup; end; $paused = false; end
on :key_held do |e|
  $p1.y -= 3 if (e.key == "up") && $p1.y > 0 && $startB && $paused != true
  $p1.y += 3 if (e.key == "down") && $p1.y < 500 && $startB && $paused != true
 $start = true if e.key == "return" && $startB == false; case e.key; when "1"
 $diff = :easy; startGame(true); when "2"; $diff = :medium; startGame(true); when "3"
 $diff = :impossible; startGame(true); end; end
def wallHit(n = false, sym = $ballDirection); if n == true
    return :leftdown if sym == :rightdown
    return :rightdown if sym == :leftdown
    return :leftup if sym == :rightup
    return :rightup if sym == :leftup
  end; return :leftdown if sym == :leftup
  return :leftup if sym == :leftdown
  return :rightdown if sym == :rightup
  return :rightup if sym == :rightdown
end; Image.new("cover.png", width: 436, height: 196, x: 275, y: 100)
ball2 = Square.new(color: "white", size: 25, y: 65, x: 686)
ball = Square.new(color: "white", size: 25, y: 310, x: 275); hitwall = false; hitwall2 = true
Text.new("Copyright CC-BY-NC-SA | stencylxd", y: 570, x: 10, size: 15)
Text.new("Press 1 for Easy Mode", y: 420, x: 360, size: 25);
Text.new("Press 2 for Normal Mode", y: 440, x: 360, size: 25);
Text.new("Press 3 for Impossible Mode", y: 460, x: 360, size: 25); update do; if $startB == false
    if ball.x < 686 && !hitwall; ball.x += 3; elsif ball.x >= 686 || hitwall;
    hitwall = true; ball.x -= 3; hitwall = false if ball.x < 275; end
    if ball2.x < 686 && !hitwall2; ball2.x += 3; elsif ball2.x >= 686 || hitwall2;
    hitwall2 = true; ball2.x -= 3; hitwall2 = false if ball2.x < 275; end
  end; startGame if $start == true; if $startB == true; $start = false; $p1.add; $right.add
    $p1top = ($p1.y - ($p1.height / 2)) + 50; $p1low = ($p1.y + ($p1.height / 2)) + 50
    $cputop = ($right.y - ($right.height / 2)) + 50
    $cpulow = ($right.y + ($right.height / 2)) + 50
    unless $paused == true; case $ballDirection; when :leftdown
      $b.x -= 3; $b.y += 3; when :leftup; $b.x -= 3
      $b.y -= 3; when :rightdown; $b.x += 3; $b.y += 3
    when :rightup; $b.x += 3; $b.y -= 3; end; end
    if $b.y > 575; $b.y -= 3; $ballDirection = wallHit;
    elsif $b.y < 0; $b.y += 3; $ballDirection = wallHit; end
    counter = $p1top; until counter == $p1low
    if $b.contains?(60, counter); $b.x += 3; $ballDirection = wallHit(true)
    end; counter += 1; end; counter = $cputop; until counter == $cpulow
    if $b.contains?(940, counter); $b.x -= 3; $ballDirection = wallHit(true);$rmed=3;$rmedB=3;
    end; counter += 1; end; if $b.x < 0; $scr2 += 1; startGame(false, true)
  elsif $b.x > 1000; $scr1 += 1; startGame(false, true); end
    $right.y = ($b.y - 25) if $diff == (:impossible || :ir) && ($diff != :medium)
    if $diff == :medium; $rmed = rand(0..1) if $rmed == 3; if $rmed == 1
        unless $b.y == $right.y; $right.y += 3 if $b.y > $right.y
        $right.y -= 3 if $b.y < $right.y; end
      elsif $rmed == 0; $rmedB = rand(0..1) if $rmedB == 3
      case $rmedB; when 0; if $right.y < 505; $right.y += 3
      else; $rmedB = 1; end; when 1; if $right.y > 0; $right.y -= 3
    else; $rmedB = 0; end; end; end; end
    if $scr1 == 9; $paused = true; $startB = false; clear
      Text.new("You win! (enter to retry)", y: 480, x: 410)
      Image.new("cover.png", width: 436, height: 196, x: 275, y: 100)
      $scr1 = 0; $scr2 = 0
    elsif $scr2 == 9; $paused = true; $startB = false; clear
      Text.new("CPU wins! (enter to retry)", y: 480, x: 410)
      Image.new("cover.png", width: 436, height: 196, x: 275, y: 100)
      $scr1 = 0; $scr2 = 0; end; $right.y = 505 if $right.y > 505
    $right.y = 0 if $right.y < 0; end; $song.loop; end; show
