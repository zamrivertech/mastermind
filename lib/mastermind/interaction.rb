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
    puts '   Colors  '
    puts '+==========+'
    count_row = 0
    board.color_board.each do |item|
      count_row += 1
      count_color = 0
      item.each do |color|
        count_color += 1
        print "|#{color.nil? ? count_color.to_s : '●'.colorize(color)}|"
      end
      print "- #{count_row}"
      puts
    end
    puts '+==========+'
    puts '    Keys    '
    puts '+==========+'
    board.key_board.each do |item|
      item.each do |color|
        print "|#{color.nil? ? 'o' : '●'.colorize(color)}|"
      end
      puts
    end
    puts '+==========+'
  end

  # display valid colors that human code breaker can choose from
  def self.display_valid_colors(colors)
    count = 0
    colors.each do |color|
      count += 1
      print ' ● '.colorize(color)
      print " #{count} ".colorize(color)
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
