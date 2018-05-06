# Convert a number to a string, the contents of which depend
# on the number's factors, more details in README.md
class Raindrops
  class << self
    # adding class methods
    def convert(num)
      raindrops = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }
      return '1' if num == 1

      factors = find_factor(num)
      result = []
      factors.map { |n| result << raindrops[n] if raindrops.key?(n) }
      result.empty? ? num.to_s : result.join
    end

    def find_factor(num)
      (1..num).select { |n| true if num % n == 0 }
    end
  end
end

# module BookKeeping
#   VERSION = 3 # Where the version number matches the one in the test.
# end
module BookKeeping
end
BookKeeping::VERSION = 3
