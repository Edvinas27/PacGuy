# frozen_string_literal: true
require 'gosu'
require_relative 'entity'

TITLE = "Rusiuotojas"
WINDOW_HEIGHT = 512
WINDOW_WIDTH = 640
TILE_SIZE = 32
POS = 32

class SorterGame < Gosu::Window

  def initialize
    super(WINDOW_WIDTH,WINDOW_HEIGHT)
    self.caption = TITLE
    @tile = Gosu::Image.load_tiles('images/bricks/tileset.png', TILE_SIZE, TILE_SIZE).last
    @map = [
      [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
      [1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1],
      [1,0,1,0,1,1,0,1,1,1,1,1,1,1,0,1,1,1,0,1],
      [1,0,1,0,1,1,0,0,0,0,0,0,1,1,0,1,1,0,0,1],
      [1,0,1,0,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,1],
      [1,0,0,0,1,1,0,1,0,0,0,1,1,1,1,0,1,0,1,1],
      [1,1,0,1,1,1,1,0,0,0,0,0,1,1,0,0,1,0,0,1],
      [1,1,0,1,1,0,1,0,0,0,0,0,1,1,0,0,1,1,0,1],
      [1,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,1,0,1],
      [1,1,1,0,1,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1],
      [1,0,0,0,1,1,0,1,1,1,0,1,1,1,0,0,0,1,0,1],
      [1,0,1,1,1,1,0,1,1,1,0,0,0,0,0,1,0,0,0,1],
      [1,0,1,1,0,0,0,1,0,1,1,1,1,1,1,1,1,0,1,1],
      [1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1],
      [1,1,1,1,0,1,1,0,0,0,0,1,0,0,0,1,1,1,1,1],
      [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    ]
    @player = Entity.new
    @x = 1
    @y = 1
  end

  def update
  end

  def button_down(id)
    case id
    when Gosu::KB_LEFT
      #move_left
      @x -= 1
    when Gosu::KB_RIGHT
      #move_right
      @x += 1
    when Gosu::KB_UP
      #move_up
      @y -= 1
    when Gosu::KB_DOWN
      #move_down
      @y += 1
    end
  end

  def draw
    @player.draw(@x,@y)

    @map.each_with_index do |row, y|
      row.each_with_index do |tile, x|
        tile == 1 ? draw_tile(@tile,x,y) : draw_tile(@tile,x,y, Gosu::Color.argb(0xff_7f7f7f))  #  0xff -> full opacity_RGB 50% GRAY
      end
    end
  end

  private

  def draw_tile(image, x, y, color = Gosu::Color::WHITE)
    image.draw(x * TILE_SIZE, y * TILE_SIZE, 0, 1, 1, color)
  end
end

SorterGame.new.show
