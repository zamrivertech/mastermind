require 'colorize'
# handle text output
class Output
  # output game intro
  def self.intro
    puts 'Welcome to MASTERMIND, Fellow Warrior!'
  end

  # display the mastermind board (color and key pegs)
  def self.display_board # rubocop:disable Metrics/AbcSize
    puts
    print '   Colors   -   Keys    '
    puts
    print '+==========++==========+'
    puts
    Board.color_board.each_with_index do |colors_row, colors_index|
      colors_row.each_with_index do |color_peg, color_index|
        print "|#{color_peg.nil? ? (color_index + 1).to_s : '●'.colorize(color_peg)}|"
        if color_index == 3
          Board.key_board.each_with_index do |keys_row, keys_index|
            next unless keys_index == colors_index

            keys_row.each_with_index do |key_peg, key_index|
              print "|#{key_peg.nil? ? 'o' : '●'.colorize(key_peg)}|"
              puts " - Row #{colors_index + 1}" if key_index == 3
            end
          end
        else
          print
        end
      end
    end
  end

  # display valid colors that human code breaker can choose
  def self.display_valid_colors
    count = 0
    Peg.colors.each_pair do |key, value|
      count += 1
      print "|#{key} - ●|".colorize(value)
      puts if count == 4
    end
  end

  def self.last_color_peg_in_row?
    print 'Final Color For Current Row!'.colorize(:yellow) if Board.last_color_peg_in_row?
  end
end
