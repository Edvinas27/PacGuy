# frozen_string_literal: true

require_relative '../a_star'

class Enemy < Entity
  SOLID_RED = "\xff\x00\x00\xff"
  SPAWN_X = 18
  SPAWN_Y = 13

  attr_accessor :strategy, :x, :y

  def initialize(strategy)
    super(SOLID_RED, SPAWN_X, SPAWN_Y)
    @strategy = strategy
  end

  def chase(player, walkable)
    @strategy.execute(self, player, walkable)
  end
end
