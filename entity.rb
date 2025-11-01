# frozen_string_literal: true
require 'gosu'

class Entity
  attr_accessor :skin, :x, :y
  def initialize(color, x = 1, y = 1)
    blob = color  * (TILE_SIZE * TILE_SIZE)
    @skin = Gosu::Image.from_blob(TILE_SIZE,TILE_SIZE, blob)
    @x = x
    @y = y
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def move_up
    @y -= 1
  end

  def move_down
    @y += 1
  end

  def draw
    @skin.draw(@x*TILE_SIZE,@y*TILE_SIZE,TILE_SIZE)
  end
end
