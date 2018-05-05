class Series
   def initialize(series)
      @series = series
   end
   def slices(num)
      result = []
      a_series = @series.scan(/\d/)    
      a_series.each_cons(num) {|a| result << a.join }  
      result    
   end
end

series = Series.new("49142")
p series.slices(3)


=begin
s = "49142"
a = s.scan(/\d/)
a.each_cons(3) { |e| p e.join}
"491"
"914"
"142"

Given a string of digits, output all the contiguous substrings of length `n` in
that string.

For example, the string "49142" has the following 3-digit series:

- 491
- 914
- 142

And the following 4-digit series:

- 4914
- 9142

And if you ask for a 6-digit series from a 5-digit string, you deserve
whatever you get.
=end
