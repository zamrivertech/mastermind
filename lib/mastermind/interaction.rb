require 'colorize'
# Display Class: responsible for text interaction with human player
class Interaction
  def self.intro
    puts 'Welcome, Fellow Stranger!'
  end

  def self.maker_or_breaker
    puts 'Would you like to be the code maker or breaker?'
    gets.chomp
  end
end
