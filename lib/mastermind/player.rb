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
end
