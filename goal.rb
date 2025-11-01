# frozen_string_literal: true

class Goal
  VALID_COLORS = {
    solid_green: "\x00\xff\x00\xff",
    solid_yellow: "\xff\xff\x00\xff"
  }

  COLOR_WEIGHTS = [:solid_green] * 9 + [:solid_yellow]
  attr_accessor :skin, :x, :y

  def initialize(x, y)
    @color = COLOR_WEIGHTS.sample
    blob = VALID_COLORS[@color] * (TILE_SIZE * TILE_SIZE)
    @skin = Gosu::Image.from_blob(TILE_SIZE,TILE_SIZE, blob)
    @x = x
    @y = y
    @can_move = false
  end

  def draw
    @skin.draw(@x*TILE_SIZE,@y*TILE_SIZE,TILE_SIZE)
  end

  def point_value
    case @color
    when :solid_green
      5
    when :solid_yellow
      55
    else
      0
    end
  end
end
