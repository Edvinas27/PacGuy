# frozen_string_literal: true

require_relative 'a_star'

class Enemy < Entity
  SOLID_RED = "\xff\x00\x00\xff"
  SPAWN_X = 18
  SPAWN_Y = 13

  def initialize
    super(SOLID_RED, SPAWN_X, SPAWN_Y)
  end

  def chase(player, walkable)
    start = [@x, @y]
    goal = [player.x, player.y]
    path = AStar.find_path(start, goal, walkable)
    unless path.empty?
      next_step = path.first
      @x, @y = next_step
    end
  end
end
