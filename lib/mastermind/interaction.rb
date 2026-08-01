require 'colorize'
# handle output and input of text
class Interaction
  # output game intro
  def self.intro
    puts 'Welcome to MASTERMIND, Fellow Warrior!'
  end

  # ask human to choose to be code breaker or maker
  def self.maker_or_breaker
    print 'Would you like to be the codemaker(1) or codebreaker(2)?:'
    gets.chomp.to_i
  end

  # announce who is breaker and maker
  def self.announce_roles(human, computer)
    puts "You: #{human.role?.capitalize} || Computer: #{computer.role?.capitalize}"
  end

  # display the mastermind board (color and key pegs)
  def self.display_board(board) # rubocop:disable Metrics/AbcSize
    puts
    print '   Colors   -   Keys    '
    puts
    print '+==========++==========+'
    puts
    board.color_board.each_with_index do |colors_row, colors_index|
      colors_row.each_with_index do |color_peg, color_index|
        print "|#{color_peg.nil? ? (color_index + 1).to_s : '●'.colorize(color_peg)}|"
        if color_index == 3
          # output corresponding key with color
          board.key_board.each_with_index do |keys_row, keys_index|
            next unless keys_index == colors_index

            keys_row.each_with_index do |key_peg, key_index|
              print "|#{key_peg.nil? ? 'o' : '●'.colorize(key_peg)}|"
              puts if key_index == 3
            end
          end
        else
          print
        end
      end
    end
  end

  # display valid colors that human code breaker can choose
  def self.display_valid_colors(colors)
    count = 0
    colors.each_pair do |key, value|
      count += 1
      print "| ● - #{key} |".colorize(value)
      puts if count == 4
    end
  end

  # get color and position input from human code breaker to enter in board
  def self.get_peg_input(board)
    display_valid_colors(Peg.colors)
    display_board(board)
    print 'Choose color and position:'
    gets.chomp
  end
end
