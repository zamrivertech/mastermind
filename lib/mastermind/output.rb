require 'colorize'
# handle text output
class Output
  # output game intro
  def self.intro
    puts 'Welcome to MASTERMIND, Fellow Warrior!'
    puts
  end

  # display color rows
  def self.display_colors_keys
    count = 0
    Board.color_board.each_with_index do |color_row, color_row_index|
      color_row.each_with_index do |color_peg, color_index|
        print "|#{color_peg.nil? ? (color_index + 1).to_s : '●'.colorize(color_peg)}|"
        next unless color_index >= 3

        display_key_row(color_row_index) unless color_row.include?(nil)
        print " Row #{count += 1}"
        puts
      end
    end
  end

  def self.display_key_row(row)
    Board.key_board[row].each do |key|
      print "|#{key.nil? ? 'o' : '●'.colorize(key)}|"
    end
  end

  # display valid colors that human code breaker can choose
  def self.display_valid_colors
    system 'clear'
    count = 0
    puts
    Peg.colors.each_pair do |key, value|
      count += 1
      print "|#{key} - ●|".colorize(value)
      puts if count == 4
    end
    puts
  end

  def self.last_color_peg_in_row
    print 'Final Color For Current Row!'.colorize(:yellow) if Board.last_color_peg_in_row?
    puts
  end

  def self.current_row
    print "Current Row: #{Board.current_color_row_index + 1}"
    puts
  end

  def self.display_board
    display_valid_colors
    puts
    display_colors_keys
    puts
    last_color_peg_in_row
    puts
    current_row
  end
end
