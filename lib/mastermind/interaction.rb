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
end
