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

  # display key feedback rows
  def self.display_key_row(row)
    Board.key_board[row].each do |key|
      print "|#{key.nil? ? 'o' : '●'.colorize(key)}|"
    end
  end

  # display code
  def self.display_code(code)
    code.each_with_index do |color, index|
      print "|#{color.nil? ? index + 1 : '●'.colorize(color)}|"
    end
  end

  # display valid colors that human code breaker can choose
  def self.display_valid_colors
    count = 0
    puts
    Peg.colors.each_pair do |key, value|
      count += 1
      print "|#{key} - ●|".colorize(value)
      puts if count == 4
    end
    puts
  end

  # display current acting row
  def self.current_row
    print "Current Row: #{Board.row_index + 1}"
    puts
  end

  # display both player roles
  def self.display_roles(computer, human)
    system 'clear'
    print "Computer: #{computer.role} | You: #{human.role}"
  end

  # display human code maker ui to create code
  def self.create_code_ui(code)
    # system 'clear'
    print 'Create a code for computer to break...'
    puts
    Output.display_valid_colors
    puts
    Output.display_code(code)
    puts
    puts
  end

  # display valid colors, colors_keys and current row
  def self.display_human_breaker_computer_maker_ui(computer_player, human_player)
    display_roles(computer_player, human_player)
    puts
    display_valid_colors
    puts
    display_colors_keys
    puts
    current_row
  end

  def self.display_human_maker_computer_breaker_ui(computer_player, human_player, code)
    display_roles(computer_player, human_player)
    puts
    print 'Your secret code: '
    display_code(code)
    puts
    display_colors_keys
  end
end
