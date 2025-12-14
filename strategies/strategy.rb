# frozen_string_literal: true

class Strategy
  def execute(enemy, player, walkable)
    raise NotImplementedError, "#{self.class} must implement #execute"
  end
end
