class Array
   def keep
      reduce([]) do |extracts, element|
        yield(element) ? extracts << element : extracts         
      end
   end
   
   def discard(&block)
      self - self.keep(&block)
   end
end


#p [1, 2, 3].keep { |e| e < 10 }

#p [1, 2, 3, 4, 5].keep(&:even?)

p [1, 2, 3].discard(&:odd?)

=begin
Implement the `keep` and `discard` operation on collections. Given a collection
and a predicate on the collection's elements, `keep` returns a new collection
containing those elements where the predicate is true, while `discard` returns
a new collection containing those elements where the predicate is false.

For example, given the collection of numbers:

- 1, 2, 3, 4, 5

And the predicate:

- is the number even?

Then your keep operation should produce:

- 2, 4

While your discard operation should produce:

- 1, 3, 5

Note that the union of keep and discard is all the elements.

https://stackoverflow.com/questions/20645390/pass-block-passed-to-method-to-another-method-in-ruby
=end