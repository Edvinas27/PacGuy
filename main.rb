# frozen_string_literal: true
require 'gosu'
require_relative 'fruit'

TITLE = "Rusiuotojas"
WINDOW_HEIGHT = 640
WINDOW_WIDTH = 800
ITEM_SPEED = 10

class SorterGame < Gosu::Window

  def initialize
    super(WINDOW_WIDTH,WINDOW_HEIGHT)
    self.caption = TITLE
    @background = Gosu::Image.new("images/background.jpg")
    @active_fruits = []
    @available_fruits =  [
      { :apple => "images/fruits/Apple.png", },
      { :banana => "images/fruits/Banana.png", },
      { :grape => "images/fruits/Grape.png", },
      { :orange => "images/fruits/Orange.png", },
      { :pineapple => "images/fruits/Pineapple.png", },
    ]
  end

  def update
    @active_fruits.each(&:update)
    if @active_fruits.last&.dropping
      spawn_fruit
    end
    @active_fruits.reject! { |fruit| fruit.off_screen?(WINDOW_WIDTH, WINDOW_HEIGHT) }
  end

  def draw
    @background.draw(0,0,0,0.3,0.4)
    @active_fruits.each(&:draw)
  end

  def button_down(id)
    case id
    when Gosu::KB_SPACE
      if @active_fruits.empty?
        spawn_fruit
      else
        @active_fruits.last.start_dropping
      end
    end
  end

  private

  def spawn_fruit
    fruit_data = @available_fruits.sample
    fruit, image_path = fruit_data.first
    @active_fruits << Fruit.new(fruit, image_path)
  end
end

SorterGame.new.show
