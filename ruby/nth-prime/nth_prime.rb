# Given a number n, determine what the nth prime is.
class Prime
  class << self
    def nth(num)
      raise ArgumentError if num == 0
      primes = []
      1.upto(num) do
        primes << next_prime(primes)
      end
      primes.last
    end

    def next_prime(cur_primes)
      num = cur_primes.empty? ? 2 : cur_primes.last + 1
      loop do
        composite = false
        cur_primes.each do |p|
          # check the current num is composite, go next number
          if (num % p) == 0
            composite = true
            break # break out each block
          end
        end
        composite ? num += 1 : break # break out of loop block
      end
      num
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end

