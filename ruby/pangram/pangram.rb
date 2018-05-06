# Determine if a sentence is a pangram. A pangram is a sentence
# using every letter of the alphabet at least once.
class Pangram
  def self.pangram?(phrase)
    # generate alphabet hash with 0 value
    alphabet_hash = {}
    ('a'..'z').each { |c| alphabet_hash[c] = 0 }

    # increase 1 for each character in hash
    phrase.each_char do |chr|
      alphabet_hash[chr.downcase] += 1 if alphabet_hash.key?(chr.downcase)
    end
    !alphabet_hash.value?(0)
  end
end

module BookKeeping
  VERSION = 6 # Where the version number matches the one in the test.
end

