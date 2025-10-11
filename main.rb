# frozen_string_literal: true
require 'gosu'

TITLE = "Rusiuotojas"

class SorterGame < Gosu::Window
  WINDOW_HEIGHT = 800
  WINDOW_WIDTH = 600
  ITEM_SPEED = 2

  def initialize
    super(WINDOW_HEIGHT, WINDOW_WIDTH)
    self.caption = TITLE
    @background = Gosu::Image.new("images/background.jpg")
  end

  def update

  end

  def draw
    @background.draw(0,0,0,0.4,0.4)
  end
end

SorterGame.new.show
