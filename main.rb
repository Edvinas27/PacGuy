# frozen_string_literal: true
require 'gosu'
require_relative 'entity'
require_relative 'maps/map'

TITLE = "Rusiuotojas"
WINDOW_HEIGHT = 512
WINDOW_WIDTH = 640
TILE_SIZE = 32
DELAY = 9.5
class SorterGame < Gosu::Window

  def initialize
    super(WINDOW_WIDTH,WINDOW_HEIGHT)
    self.caption = TITLE
    @tile = Gosu::Image.load_tiles('images/bricks/tileset.png', TILE_SIZE, TILE_SIZE).last
    @map = Map.level1
    @player = Entity.new
    @frames = 0
  end

  def update
    @frames += 1
    if @frames > DELAY && moving_input_down?
      move_player
      @frames = 0
    end
  end

  def draw
    @player.draw
    @map.each_with_index do |row, y|
      row.each_with_index do |tile, x|
        tile == 1 ? draw_tile(@tile,x,y) : draw_tile(@tile,x,y, Gosu::Color::GRAY)
      end
    end
  end

  private

  def draw_tile(image, x, y, color = Gosu::Color::WHITE)
    image.draw(x * TILE_SIZE, y * TILE_SIZE, 0, 1, 1, color)
  end

  def will_not_collide?(x,y)
    @map[y][x] != 1
  end

  def moving_input_down?
      Gosu.button_down?(Gosu::KB_LEFT) ||
      Gosu.button_down?(Gosu::KB_RIGHT) ||
      Gosu.button_down?(Gosu::KB_UP) ||
      Gosu.button_down?(Gosu::KB_DOWN)
  end

  def move_player
    if Gosu.button_down? Gosu::KB_LEFT
      new_x = @player.x - 1
      @player.move_left if will_not_collide?(new_x, @player.y)
    elsif Gosu.button_down? Gosu::KB_RIGHT
      new_x = @player.x + 1
      @player.move_right if will_not_collide?(new_x, @player.y)
    elsif Gosu.button_down? Gosu::KB_UP
      new_y = @player.y - 1
      @player.move_up if will_not_collide?(@player.x, new_y)
    elsif Gosu.button_down? Gosu::KB_DOWN
      new_y = @player.y + 1
      @player.move_down if will_not_collide?(@player.x, new_y)
    end
  end
end

SorterGame.new.show
