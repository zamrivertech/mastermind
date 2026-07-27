require 'colorize'
# Display Class: responsible for text interaction with human player
class Interaction
  def self.intro
    puts 'Welcome to MASTERMIND, Fellow Warrior!'
  end

  def self.maker_or_breaker
    print 'Would you like to be the codemaker(1) or codebreaker(2)?:'
    gets.chomp.to_i
  end

  def self.announce_roles(human, computer)
    system 'clear'
    puts "You: #{human.role?.capitalize} || Computer: #{computer.role?.capitalize}"
  end

  def self.display_board(board)
    puts '        Colors        |       Keys          '
    puts '======================|====================='
    board.each_with_index do |item, index|
      # left is even so color
      print "|#{item}|" if index.even?
      # right is odd so key pegs
      next unless index.odd?

      item.each do |key|
        print "|#{key}|"
      end
      puts
    end
    puts '======================|====================='
  end
end
