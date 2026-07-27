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

  def self.display_board(board) # rubocop:disable Metrics/MethodLength,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity,Metrics/AbcSize
    puts '   Colors       Keys    '
    puts '===========|============'
    board.each_with_index do |item, index|
      if index.even?
        item.each do |color|
          print "|#{color.nil? ? 'O' : '●'.colorize(color)}|"
        end
      end
      if index.odd? # rubocop:disable Style/Next
        item.each_with_index do |key, index|
          print "|#{key.nil? ? 'o' : 'x'}|"
          puts if index == 3
        end
      end
    end
    puts '===========|============'
  end

  def self.display_valid_colors(colors)
    count = 0
    print '======================='
    puts
    colors.each do |color|
      count += 1
      print ' ● '.colorize(color)
      print " #{count} ".colorize(color)
    end
    puts
    puts '======================='
  end

  def self.color_input
    puts
    print 'Choose color and position:'
    gets.chomp
  end
end
