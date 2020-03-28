
# pong, but for my dad | stencylxd 2020

require "ruby2d"; set width: 1000, height: 600, title: "Pong | stencylxd"
$ballDirection = :none; $start = false
$scr1 = 0; $scr2 = 0; $startB = false
$diff = :impossible; $paused = true
$right = Rectangle.new(color: "blue", x: 940, y: 250, height: 100, width: 10)
$p1 = Rectangle.new(color: "red", x: 60, y: 250, height: 100, width: 10)
def startGame; clear; $b = Square.new(color: "white", size: 25, x: 475, y: 275)
  $p1.y = 250 if $startB == false
  $s1 = Text.new($scr1.to_s, color: "red", size: 40, x: 30, y: 5) unless $diff == :impossible
  $s2 = Text.new($scr2.to_s, color: "blue", size: 40, x: 970, y: 5)
  $start = false; $startB = true; $ballDirection == false; case rand(0..3); when 0
      $ballDirection = :leftdown; when 1
      $ballDirection = :leftup; when 2
      $ballDirection = :rightdown; when 3
      $ballDirection = :rightup; end; $paused = false; end
on :key_held do |e|
  $p1.y -= 3 if (e.key == "up") && $p1.y > 0 && $startB && $paused != true
  $p1.y += 3 if (e.key == "down") && $p1.y < 500 && $startB && $paused != true
 $start = true if e.key == "return" && $startB == false; end
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
Text.new("Press Enter To Play!", y: 480, x: 410); update do; if $startB == false
    if ball.x < 686 && hitwall == false; ball.x += 3; elsif ball.x >= 686 || hitwall == true;
    hitwall = true; ball.x -= 3; hitwall = false if ball.x < 275; end
    if ball2.x < 686 && hitwall2 == false; ball2.x += 3; elsif ball2.x >= 686 || hitwall2 == true;
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
    if $b.contains?(940, counter); $b.x -= 3; $ballDirection = wallHit(true)
    end; counter += 1; end; if $b.x < 0; $scr2 += 1; startGame
  elsif $b.x > 1000; $scr1 += 1; startGame; set color: "random"; end

    $right.y = ($b.y - 25) if $diff == :impossible

    if $scr1 == 9
      $paused = true; $startB = false; clear
      Text.new("You win! (enter to retry)", y: 480, x: 410)
      Image.new("cover.png", width: 436, height: 196, x: 275, y: 100)
      $scr1 = 0; $scr2 = 0
    elsif $scr2 == 9
      $paused = true; $startB = false; clear
      Text.new("CPU wins! (enter to retry)", y: 480, x: 410)
      Image.new("cover.png", width: 436, height: 196, x: 275, y: 100)
      $scr1 = 0; $scr2 = 0
    end


    $right.y = 505 if $right.y > 505; $right.y = 0 if $right.y < 0;
  end

end
show
