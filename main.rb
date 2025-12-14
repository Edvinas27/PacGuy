# frozen_string_literal: true
require 'gosu'
require_relative 'entities/entity'
require_relative 'maps/map'
require_relative 'entities/goal'
require_relative 'factories/goal_factory'
require_relative 'player'
require_relative 'entities/enemy'
require_relative 'strategies/chase_strategy'

TITLE = "PacDude"
WINDOW_HEIGHT = 512
WINDOW_WIDTH = 640
TILE_SIZE = 32
DELAY = 9.5
ENEMY_DELAY = 12
class SorterGame < Gosu::Window

  def initialize
    super(WINDOW_WIDTH,WINDOW_HEIGHT)
    self.caption = TITLE
    @frames = 0
    @enemy_frames = 0
    @tile = Gosu::Image.load_tiles('images/bricks/tileset.png', TILE_SIZE, TILE_SIZE).last
    @map = Map.level1
    @player = Player.new
    @enemy = Enemy.new(ChaseStrategy.new)
    @goals = GoalFactory.create_random_goal(@map, 2)
  end

  def update
    @frames += 1
    @enemy_frames += 1
    if @frames > DELAY && moving_input_down?
      move_player
      @frames = 0
    end

    @goals.each do |goal|
      if goal.x == @player.x && goal.y == @player.y
        @goals.delete(goal)
        @player.increase_score(goal.point_value)
        @goals << GoalFactory.create_random_goal(@map, 1).first
        self.caption = "#{TITLE} - Score: #{@player.score}"
        break
      end
    end

    walkable = ->(x,y) { will_not_collide?(x,y) }

    if @enemy_frames > ENEMY_DELAY
      @enemy.chase(@player, walkable)
      @enemy_frames = 0
    end

    if @enemy.x == @player.x && @enemy.y == @player.y
      @player.can_move = false
      @goals.each do |goal|
        @goals.delete(goal)
      end
      self.caption = "#{TITLE} - Game Over! Final Score: #{@player.score}"
    end
  end

  def draw
    @player.draw
    @enemy.draw
    @goals.each(&:draw)
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
    return unless @player.can_move?
    directions = {
      Gosu::KB_RIGHT => [:x, 1, :move_right],
      Gosu::KB_UP    => [:y, -1, :move_up],
      Gosu::KB_DOWN  => [:y, 1, :move_down],
      Gosu::KB_LEFT  => [:x, -1, :move_left]
    }
    directions.each do |key, value|
      coord = value[0]
      direction = value[1]
      method = value[2]

      if Gosu.button_down?(key)
        new_pos = @player.send(coord) + direction
        if coord == :x
          @player.send(method) if will_not_collide?(new_pos, @player.y)
        else
          @player.send(method) if will_not_collide?(@player.x, new_pos)
        end
        break
      end
    end
  end
end

SorterGame.new.show
