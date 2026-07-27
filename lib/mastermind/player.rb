# Player Module: define player type to be codemaker or breaker
module Player
  attr_reader :role

  @@roles = %w[codemaker codebreaker] # rubocop:disable Style/ClassVars
  def initialize(role)
    @role = setrole(role)
  end

  def setrole(type)
    if type == 1
      @@roles[0]
    elsif type == 2
      @@roles[1]
    else
      setrole(Interaction.maker_or_breaker)
    end
  end

  def role?
    @role
  end

  # def add_color(role, color, index, board)
  # if codebreaker?(role)

  # end
  # end

  def codebreaker?(player)
    true if player.role? == @@roles[1] # rubocop:disable Lint/Void
    false
  end

  def codemaker?(player)
    true if player.role? == @@roles[0] # rubocop:disable Lint/Void
    false
  end
end
