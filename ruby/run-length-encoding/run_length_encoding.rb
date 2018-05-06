# Implement run-length encoding and decoding.
# Run-length encoding (RLE) is a simple form of data compression, where runs
# (consecutive data elements) are replaced by just one data value and count.
class RunLengthEncoding
  class << self
    # replace consecutive repeated chars with number
    def encode(input)
      return '' if input.empty?

      result = ''
      current_chr = input[0]
      chr_count = 1
      start = input[1..input.size - 1]

      start.each_char do |chr|
        if chr == current_chr
          chr_count += 1
        else
          chr_count == 1 ? result << current_chr : result << chr_count.to_s + current_chr
          current_chr = chr
          chr_count = 1
        end
      end
      chr_count == 1 ? result << current_chr : result << chr_count.to_s + current_chr
      result
    end

    # convert repeated number into chars
    def decode(input)
      return '' if input.empty?

      result = ''
      chr_count = 0
      input.each_char do |chr|
        if chr.match?(/[0-9]/)
          chr_count = chr_count.zero? ? chr.to_i : chr_count * 10 + chr.to_i
        else
          chr_count.zero? ? result << chr : result << chr * chr_count
          # result << chr_count.zero? ? chr : chr * chr_count this doesn't work
          chr_count = 0
        end
      end
      result
    end
  end
end

# module BookKeeping
#   VERSION = 3 # Where the version number matches the one in the test.
# end
module BookKeeping
end
BookKeeping::VERSION = 3
