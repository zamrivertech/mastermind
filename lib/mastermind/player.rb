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

  def add_color
    return unless codebreaker?

    user_choice = Interaction.color_input.split('')
    Board.add_color(Peg.color(user_choice[0].to_i), 1, user_choice[1].to_i)
  end

  def codebreaker?
    role? == @@roles[1]
  end

  def codemaker?
    role? == @@roles[0]
  end
end
