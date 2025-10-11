# frozen_string_literal: true
require 'gosu'
require_relative 'fruit'

TITLE = "Rusiuotojas"
WINDOW_HEIGHT = 800
WINDOW_WIDTH = 600
ITEM_SPEED = 5

class SorterGame < Gosu::Window

  def initialize
    super(WINDOW_WIDTH,WINDOW_HEIGHT)
    self.caption = TITLE
    @background = Gosu::Image.new("images/background.jpg")
    @active_fruits = []
    @fruits =  [
      { :apple => "images/fruits/Apple.png", },
      { :banana => "images/fruits/Banana.png", },
      { :grape => "images/fruits/Grape.png", }
    ]
    @spawn_timer = 0
  end

  def update
    @active_fruits.each(&:update)
    @active_fruits.reject! { |fruit| fruit.off_screen?(WINDOW_WIDTH, WINDOW_HEIGHT) }
  end

  def draw
    @background.draw(0,0,0,0.4,0.4)
    @active_fruits.each(&:draw)
  end

  def button_down(id)
    case id
    when Gosu::KB_SPACE
      if @active_fruits.any?
        @active_fruits.last.start_dropping
      else
        spawn_fruit
      end
    end
  end

  private

  def spawn_fruit
    fruit_data = @fruits.sample
    fruit, image_path = fruit_data.first
    @active_fruits << Fruit.new(fruit, image_path)
  end
end

SorterGame.new.show
