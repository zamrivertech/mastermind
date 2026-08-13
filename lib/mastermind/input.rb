# handle text input
class Input
  # get color and position input from human code breaker to enter in board
  def self.color_position
    print 'Choose color and position:'
    gets.chomp
  end

  # ask human code to choose to be code breaker or maker
  def self.maker_or_breaker
    print 'Would you like to be the codemaker(1) or codebreaker(2)?:'
    gets.chomp.to_i
  end

  def self.confirm_row?
    print 'Confirm Row?!'.colorize(:yellow)
    gets.chomp
  end
end
