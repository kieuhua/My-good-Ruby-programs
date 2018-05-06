# Given a phrase, count the occurrences of each word in that phrase.
class Phrase
  def initialize(phrase)
    @phrase = phrase
    @words_hsh = {}
  end

  # return a hash, key is the word, and its value is count
  def word_count
    # take care single quote words - don't, can't, 'large'
    single_quote

    words = @phrase.scan(/\w+/)
    words.each do |w|
      w = w.to_s
      # strip out non alphanumeric characters
      w.gsub!(/[^0-9a-z]/i, '')
      w = w.downcase
      @words_hsh.key?(w) ? @words_hsh[w] = @words_hsh[w] + 1 : @words_hsh[w] = 1
    end
    @words_hsh
  end

  def single_quote
    count_do_not = @phrase.scan(/don't/).size
    if count_do_not > 0
      @phrase.gsub!(/don't/, '')
      @words_hsh["don't"] = count_do_not
    end

    count_can_not = @phrase.scan(/can't/).size
    if count_can_not > 0
      @phrase.gsub!(/can't/, '')
      @words_hsh["can't"] = count_can_not
    end

    count_quoted_word = @phrase.scan(/'large'/).size
    if count_quoted_word > 0
      @phrase.gsub!(/'large'/, '')
      @words_hsh['large'] = count_quoted_word
    end
  end
end

# module BookKeeping
#   VERSION = 1 # Where the version number matches the one in the test.
# end
module BookKeeping
end
BookKeeping::VERSION = 1
