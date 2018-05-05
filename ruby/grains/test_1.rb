class Grains
   class << self
      def square(number)
         return 1 if number == 1
         sum = 0
         (1..number).each do |num|
            grains = 2 ** num
            #puts "square #{num}: #{grains}"
             sum += grains
         end
         puts sum
      end
   end   
end

Grains.square(1)

=begin

- Optimize for speed.
- Optimize for readability.

Then please share your thoughts in a comment on the submission. Did this
experiment make the code better? Worse? Did you learn anything from it?

Write code that shows:
- how many grains were on each square, and
- the total number of grains
=end

Grains.total
##########

#puts Benchmark.measure { Grains.total }

#ruby grains.rb
# User CPU time, cpu spent processing instructions from your 'userland' code
# system cpu time, cpu time spent processing instructions from kernel code (system calls)
# user cpu time, + system cpu time
# Elapsed real time(start-finish)
#  0.000028   0.000006   0.000034 (  0.000028)


def total1
   (1..64).reduce { |sum, n| sum + 2**(n -1) }       
end
def total2
   sum = 0
   (1..64).each { |n| sum += 2**(n -1) } 
   sum      
end

I was surpised that total1 take 10% long than total2; however I think total1 is better in readability.

iterations = 100_000

Benchmark.bm do |bm|
   bm.report do
      iterations.times do
        Grains.total1
      end
   end
   bm.report do
      iterations.times do
        Grains.total2
      end
   end
end


ruby grains.rb
       user     system      total        real
   0.956172   0.001532   0.957704 (  0.958861)    # total1  10% more 
   0.846227   0.000682   0.846909 (  0.847259)     # total2
