
# sprite.rb ||stencylxd 2020

require "ruby2d"

set width: 1000, height: 700, title: "Sprite"

animation = Sprite.new(
  'walking.png',
  width: 72,
  height: 82,
  x: 500,
  y: 500,
  clip_width: 36,
  time: 150,
  animations: {
    walk: 1..6,
  }
)

Text.new("I tried, okay? It's my first time.", x: 425, y: 400)

animation.play animation: :walk, loop: true, flip: :horizontal
show