# handles being the code maker or breaker opposite as human player
class ComputerPlayer
  include Player
  # check human role and be the opposite
  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  # create secret code if code maker
  def make_code
    return unless codemaker?

    [Peg.random_color, Peg.random_color, Peg.random_color, Peg.random_color]
  end

  def key_feedback(code) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    if Board.previous_color_row_full? # rubocop:disable Style/GuardClause
      count = 0
      code.each do |code_color|
        Board.previous_color_row.each do |tried_color|
          if Board.previous_color_row.include?(code_color) # rubocop:disable Style/Next
            p code
            puts 'HIT'
            p Board.key_board
            if Board.previous_color_row.index(code_color) == code.index(tried_color)
              Board.add_key(:black, Board.previous_color_row_index, count)
            else
              Board.add_key(:white, Board.previous_color_row_index, count)
            end
            count += 1
          end
        end
      end
    end
  end
end
