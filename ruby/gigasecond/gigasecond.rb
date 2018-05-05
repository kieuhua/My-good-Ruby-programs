class Gigasecond
   def self.from(t)
     # convert utc time to seconds (epoch time)
     t1 = t.tv_sec + 10**9
     # convert epoch time to utc
     t2 = Time.at(t1).utc
     years = t2.year
     months = t2.month
     days = t2.day
     hours = t2.hour
     mins = t2.min
     secs = t2.sec
     Time.utc(years, months, days, hours, mins, secs)
   end
end

class BookKeeping
end
BookKeeping::VERSION = 6

