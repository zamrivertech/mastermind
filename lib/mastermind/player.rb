# Player Module: define player type to be codemaker or breaker
module Player
  attr_reader :role

  def initialize(role)
    @role = setrole(role)
  end

  def setrole(type)
    if type == 1
      'codemaker'
    elsif type == 2
      'codebreaker'
    else
      setrole(Interaction.maker_or_breaker)
    end
  end

  def role?
    @role
  end
end
