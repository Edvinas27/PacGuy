# frozen_string_literal: true
require 'gosu'

class Entity
  WHITE_COLOR = "\xff\xff\xff\xff"
  attr_accessor :skin, :x, :y
  def initialize
    blob = WHITE_COLOR  * (TILE_SIZE * TILE_SIZE)
    @skin = Gosu::Image.from_blob(TILE_SIZE,TILE_SIZE, blob)
    @x = 1
    @y = 1
    @can_move = true
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
