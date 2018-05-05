class Series
   def initialize(series)
      @series = series
   end
   def slices(num)
      raise ArgumentError if num > @series.size
      
      result = []
      a_series = @series.scan(/\d/)    
      a_series.each_cons(num) {|a| result << a.join }  
      result    
   end
end