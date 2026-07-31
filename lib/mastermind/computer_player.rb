# handles being the code maker or breaker opposite as human player
class ComputerPlayer
  include Player
  # check human role and be the opposite
  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  # create secret code if code maker
  def make_code
    return unless codemaker?

    [Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3))]
  end

  def key_feedback
  end
end
