require 'colorize'
# Display Class: responsible for text interaction with human player
class Interaction
  def self.intro
    puts 'Welcome, Fellow Stranger!'
  end

  def self.maker_or_breaker
    print 'Would you like to be the codemaker(1) or codebreaker(2)?:'
    gets.chomp.to_i
  end
end
