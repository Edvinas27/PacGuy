# frozen_string_literal: true

class Fruit
  attr_reader :x, :y, :type, :dropping

  def initialize(type, image_path)
    @type = type
    @image = Gosu::Image.new(image_path)
    @x = 0
    @y = WINDOW_HEIGHT/2
    @speed = ITEM_SPEED + rand(3)
    @dropping = false
  end

  def update
    if @dropping
      @y += @speed
    else
      @x += @speed
    end
  end

  def draw
    @image.draw(@x, @y, scale_x = 1.9,scale_y = 2.8)
  end

  def off_screen?(window_width, window_height)
    @x > window_width || @y > window_height
  end

  def start_dropping
    @dropping = true
  end
end
