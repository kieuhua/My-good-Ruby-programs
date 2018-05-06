# Calculate the Hamming difference between two DNA strands.
# Please read README.md for more details
class Hamming
  def self.compute(str1, str2)
    raise ArgumentError unless str1.size == str2.size

    hamming_distance = 0
    str1.each_char.with_index do |chr, idx|
      hamming_distance += 1 unless chr == str2[idx]
    end
    hamming_distance
  end
end

# module BookKeeping
#   VERSION = 3 # Where the version number matches the one in the test.
# end
module BookKeeping
end
BookKeeping::VERSION = 3
