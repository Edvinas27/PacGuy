# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player do
  describe '#initialize' do
    it 'creates a Player with the correct default attributes' do
      player = Player.new
      expect(player.score).to eq(0)
      expect(player.can_move?).to be true
    end
  end

  describe '#increase_score' do
    it 'increases the player score by the given value' do
      player = Player.new
      player.increase_score(10)
      expect(player.score).to eq(10)
      player.increase_score(5)
      expect(player.score).to eq(15)
    end

    it 'increases the player score by 0 if no value is given' do
      player = Player.new
      player.increase_score
      expect(player.score).to eq(0)
    end
  end
end