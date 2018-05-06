# Given a year, report if it is a leap year.
class Year
  class << self
    def leap?(years)
      return false unless years % 4 == 0
      if years%100 == 0 
        return false unless years%400 == 0  
      end 
      true        
    end
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
