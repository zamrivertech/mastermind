# ComputerPlayer Class: act as code maker or breaker opposite as human player
class ComputerPlayer
  include Player
  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  def make_code
    return unless codemaker?

    [Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3))]
  end
end
