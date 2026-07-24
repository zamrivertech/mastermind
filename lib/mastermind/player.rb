# Player Module: define player type to be codemaker or breaker
module Player
  def initialize(type)
    @type = validate_type(type)
  end

  def validate_type(type)
    'codemaker' if type == 1 # rubocop:disable Lint/Void
    'codebreaker'
  end
end
