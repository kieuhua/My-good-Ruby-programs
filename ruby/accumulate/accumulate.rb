# Implement the `accumulate` operation, which, given a collection and an
# operation to perform on each element of the collection, returns a new
# collection containing the result of applying that operation to each element of
# the input collection.
class Array
  def accumulate
    result = []
    each do |element|
      result.push yield element
    end
    result
  end
end

# module BookKeeping
#   VERSION = 1 # Where the version number matches the one in the test.
# end
module BookKeeping
end
BookKeeping::VERSION = 1
