class Array   
   def accumulate( &block)
      for element in self
         p yield element
      end
   end        
end

result = [1,2,3].accumulate do |number|
   number * number
end
p result

=begin
operations:
:upcase(word), :reverse(word), '*', 

dup on '*'

# nested accumalte= recursively

- 1, 2, 3, 4, 5

And the operation:

- square a number (`x => x * x`)

Your code should be able to produce the collection of squares:

- 1, 4, 9, 16, 25


def my_method(&block)
  puts block
  block.call
end

my_method { puts "Hello!" }
=end

