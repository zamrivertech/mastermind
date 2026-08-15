# define player roles in game
module Player
  # access to current role of player in game
  attr_reader :role

  # game roles
  @@roles = %w[codemaker codebreaker] # rubocop:disable Style/ClassVars

  # set role when child obj is created
  def initialize(role)
    @role = setrole(role)
  end

  # set a respective role based on choice
  def setrole(type)
    if type == 1
      @@roles[0]
    elsif type == 2
      @@roles[1]
    else
      setrole(Input.maker_or_breaker)
    end
  end

  # true if player type is codebreaker
  def codebreaker?
    @role.to_s == @@roles[1].to_s
  end

  # true if player is codemaker
  def codemaker?
    @role.to_s == @@roles[0].to_s
  end
end
