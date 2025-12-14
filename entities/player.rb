# frozen_string_literal: true

class Player < Entity
  WHITE_COLOR = "\xff\xff\xff\xff"

  attr_accessor :score, :can_move

  def initialize
    super(WHITE_COLOR)
    @score = 0
    @can_move = true
  end
  def increase_score(value = 0)
    @score += value
  end

  def can_move?
    @can_move
  end
end
