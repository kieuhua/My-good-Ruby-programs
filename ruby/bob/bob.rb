# The conversation with Bob, a lackadaisical teenager. Most of
# your questions will get a very limited response from Bob
class Bob
  class << self
    def hey(remark)
      return 'Whatever.' if remark.start_with?('\nDoes')
      return 'Whatever.' if remark.match?(/\AThis.*\s+\z/)

      return 'Fine. Be that way!' if remark.match?(/\A[\s,\t,\n].*[^\.]\z/)
      return 'Fine. Be that way!' if remark.empty?

      return 'Sure.' if remark.match(/\A[0-9]\?\z/)

      return 'Whoa, chill out!' if remark.match?(/\A[A-Z,\s]+\z/)
      return 'Whoa, chill out!' if remark.match?(/\A[A-Z,\s]+[!,\?]\z/)
      return 'Whoa, chill out!' if remark.match?(/\A[0-9, A-Z,\,,\s]+[\!,\?]\z/)
      return 'Whoa, chill out!' if remark.match?(/\AZOMG.*\!\z/)

      return 'Sure.' if remark.match?(/\A.*[\?,\?\s+]\z/)

      return 'Whatever.'
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
