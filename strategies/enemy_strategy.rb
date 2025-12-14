# frozen_string_literal: true

class EnemyStrategy
  def execute(enemy, player, walkable)
    raise NotImplementedError, "#{self.class} must implement #execute"
  end
end
