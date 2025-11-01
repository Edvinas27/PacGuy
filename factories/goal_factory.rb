# frozen_string_literal: true

class GoalFactory
  def self.create_random_goal(map, count)
    objects = []
    count.times do
      x, y = random_position(map)
      objects << Goal.new(x, y)
    end
    objects
  end

  private

  def self.random_position(map)
      coords = []
      map.each_with_index do | row, y |
        row.each_with_index do | tile, x |
          coords << [x, y] if tile == 0
        end
      end
      r_x, r_y = coords.sample
      [r_x, r_y]
  end
end
