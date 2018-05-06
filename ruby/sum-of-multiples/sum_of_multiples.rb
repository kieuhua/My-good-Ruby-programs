# Given a number, find the sum of all the unique multiples of
# particular numbers up to but not including that number.
class SumOfMultiples
  def initialize(*args)
    @list = args
  end

  def to(top)
    return 0 if @list.length.zero?
    return 0 if top < @list.min

    sum = []
    @list.each do |num|
      # return array of the multiplies of this number num
      mults = find_multiply(num, top)
      sum += mults
    end
    sum.uniq.reduce(&:+)
  end

  def find_multiply(num, top)
    list = []
    # find all multiply of this number,
    # and multiply should be smaller than top
    (1..top).each do |m|
      p = m * num
      list << p if p < top
    end
    list
  end
end

module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end
