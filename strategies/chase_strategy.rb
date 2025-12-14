# frozen_string_literal: true

require_relative '../a_star'
require_relative '../strategies/enemy_strategy'

class ChaseStrategy < EnemyStrategy
  def execute(enemy, player, walkable)
    start = [enemy.x, enemy.y]
    goal = [player.x, player.y]
    path = AStar.find_path(start, goal, walkable)

    return if path.empty?

    next_step = path.first
    enemy.x, enemy.y = next_step
  end
end
