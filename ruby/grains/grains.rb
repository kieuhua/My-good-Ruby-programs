# Calculate the number of grains of wheat on a chessboard given that the number
# on each square doubles.
class Grains
  CHESSBOARD_SQUARES = 64
  class << self
    def square(num)
      raise ArgumentError unless (1..CHESSBOARD_SQUARES).cover?(num)
      2**(num - 1)
    end

    def total
      (1..CHESSBOARD_SQUARES).sum { |n| square(n) }
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
