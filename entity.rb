# frozen_string_literal: true
require 'gosu'

class Entity
  attr_accessor :skin
  def initialize()
    blob = "\xff\xff\xff\xff"  * (TILE_SIZE * TILE_SIZE)
    @skin = Gosu::Image.from_blob(TILE_SIZE,TILE_SIZE, blob)
  end

  def move_left

  end

  def move_right

  end

  def move_up

  end

  def move_down

  end

  def draw(x, y)
    @skin.draw(x*TILE_SIZE,y*TILE_SIZE,TILE_SIZE)
  end
end
