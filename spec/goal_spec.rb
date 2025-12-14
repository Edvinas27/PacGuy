# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Goal do
  describe '#initialize' do
    it 'creates a Goal with the correct position' do
      goal = Goal.new(5, 10)
      expect(goal.x).to eq(5)
      expect(goal.y).to eq(10)
    end
  end

  describe '#draw' do
    it 'draws the goal at the correct position' do
      goal = Goal.new(2, 3)
      expect(goal.skin).to receive(:draw).with(2 * TILE_SIZE, 3 * TILE_SIZE, TILE_SIZE)
      goal.draw
    end
  end

  describe '#point_value' do
    it 'returns 5 for solid_green goals' do
      allow(Goal::COLOR_WEIGHTS).to receive(:sample).and_return(:solid_green)
      goal = Goal.new(0, 0)
      expect(goal.point_value).to eq(5)
    end

    it 'returns 55 for solid_yellow goals' do
      allow(Goal::COLOR_WEIGHTS).to receive(:sample).and_return(:solid_yellow)
      goal = Goal.new(0, 0)
      expect(goal.point_value).to eq(55)
    end
  end
end