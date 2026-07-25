# Board Class: responsible for Mastermind board structure
class Board
  @grid = Array.new(6) { Array.new(6) }

  class << self
    attr_reader :grid
  end

  def self.color_peg_rows
    @grid.select.with_index { |item, index| item if index.even? }
  end

  def self.key_peg_rows
    @grid.select.with_index { |item, index| item if index.odd? }
  end
end
