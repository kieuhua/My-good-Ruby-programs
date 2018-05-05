
class Bob
   class << self
      def hey(remark)
         return "Sure." if remark.match(/\A.*[\?,\?\s+]\z/)
         return "Fine. Be that way!" if remark.start_with?("  ", "\t", "\n")
         return "Fine. Be that way!" if remark.empty?
         return "Whoa, chill out!" if remark.ending_with?("!")
         return "Whoa, chill out!" if remark.match?(/[A-Z]/)
         return "Whatever"
      end
   end
end



s = "RWIWIWI"
s.match?(/[A-Z]/)


ending '?  ' => "Sure."
may have some spaces

ending '!' or all capital letters => 'Whoa, chill out!'

"", "  ", "\t\t\t", "   hmm.."=> "Fine. Be that way!"
blank, leading spaces, leading "\t", "\n"

'Whatever' => for anything else



Bob hears "Tom-ay-to, tom-aaaah-to.", and...
Expected: "Whatever."
  Actual: nil


https://ruby-doc.org/stdlib-2.1.3/libdoc/test/unit/rdoc/Test/Unit/Assertions.html#method-i-assert_equal
assert_equal(expected, actual, failue_message = nil)


# Bob

Bob is a lackadaisical teenager. In conversation, his responses are very limited.

Bob answers 'Sure.' if you ask him a question.

He answers 'Whoa, chill out!' if you yell at him.

He says 'Fine. Be that way!' if you address him without actually saying
anything.

He answers 'Whatever.' to anything else.
