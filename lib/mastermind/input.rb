# handle text input
class Input
  # get color and position input from human code breaker to enter in board
  def self.color_position
    print 'Choose color and position:'
    gets.chomp
  end

  # ask human to choose to be code breaker or maker
  def self.maker_or_breaker
    print 'Would you like to be the codemaker(1) or codebreaker(2)?:'
    gets.chomp.to_i
  end

  # get row confirm from human code breaker
  def self.confirm_row?
    puts
    print 'Confirm colors? (y/n):'.colorize(:yellow)
    gets.chomp
  end

  def self.feedback(index)
    puts
    print "Enter your feedback peg for currrent row at #{index + 1}?"
    gets.chomp
  end
end
