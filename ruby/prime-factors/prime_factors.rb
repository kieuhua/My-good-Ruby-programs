# Compute the prime factors of a given natural number.
class PrimeFactors
  class << self
    def for(top)
      fractors = []
      num = 2
      loop do
        if top % num == 0
          top /= num
          fractors << num
          next
        end
        return fractors if num >= top
        num += 1
      end
    end
  end
end
