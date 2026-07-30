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

  def add_color(board, code, computer_player)
    return unless codebreaker?

    while board.current_color_row != -1
      user_choice = Interaction.color_input(board).split('')
      p code
      board.add_color(Peg.color(user_choice[0].to_i - 1), board.current_color_row, user_choice[1].to_i - 1)
      computer_player.key_feedback(board, code)
      if board.previous_color_row == code
        puts 'You won!'
        break
      end
    end
  end

  def codebreaker?
    role? == @@roles[1]
  end

  def codemaker?
    role? == @@roles[0]
  end
end
