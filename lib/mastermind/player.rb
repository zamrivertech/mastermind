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

  # add color as human code breaker into board color pegs
  def add_color(board)
    return unless codebreaker?

    while board.current_color_row_index != -1
      user_choice = Interaction.get_peg_input(board).split('')
      board.add_color(Peg.color(user_choice[0]), board.current_color_row_index, user_choice[1].to_i - 1)
    end
  end

  def codebreaker?
    role? == @@roles[1]
  end

  def codemaker?
    role? == @@roles[0]
  end
end
