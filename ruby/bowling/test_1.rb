class Frame
   attr_accessor :id, :status, :count
   def initialize(id)
      @id = id
      @status = 0    # done = 0, 2= strike, 1 = spare, default = 0
      @count= 0      
   end
end

class Game
   def initialize
      @pins = []
      @frames = Array.new(21) { |i| Frame.new(i+1) }
      @working = []      
   end

    def roll(pins)
       raise BowlingError, "Beginning of roll method" unless (0..10).cover?(pins)
       # need to check same frame
       p_size = @pins.size 
      
       #if p_size.even? && (p_size != 0)
       # test total frame value can't > 10 if no strike
       if p_size.odd? && !p_size.zero? && @pins[p_size-1] != 10 
          f_value = @pins[p_size-1] + pins
          
          if f_value > 10 
             raise BowlingError, "Frame value can't > 10, if no strike"
          end
       end
       
       # check for last strike and last two bonus can't > 10
       if (p_size == 20) && @pins[18] == 10 && @pins[19] != 10 && @pins[20] != 10
          raise BowlingError, "The last Frame bonus can't > 10" if @pins[19] + pins > 10          
        end
        
        # To have 21 thows, then there should be strike or spare on last frame, 
        p_size = @pins.size
        if p_size == 20 
           if @pins[18] != 10                          
             if @pins[19] != 10      
               if (@pins[18] + @pins[19]) != 10
                 raise BowlingError, "can't 21 throws if no strike or spare " 
               end

             end           
           end    
        end
                   
       @pins << pins      
    end
   
   def score
      #raise BowlingError if @pins.empty?
      raise BowlingError, "Beginning score method" unless (12..21).cover?(@pins.size)
           
      result = 0
      f_id = 0
      # check for more than 21 => invalid
      @pins.each.with_index do |val, idx|
         result += val
         f_id = idx
         
         # check the @working see any bonus need to add to result
         @working.each do |id|
            if f_id < 20
               if (@frames[id].status == 2) || (@frames[id].status == 1)              
                 result += val
                 @frames[id].count -= 1
               end 
            end 
         end
               
         # check for strike
        #  a_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once
         if val == 10 && f_id < @pins.size - 3
            @frames[f_id].status = 1
            @frames[f_id].count = 2
            @working << f_id        
         end
         # check for spare
         if idx.odd?     # 2nd throw on same frame

            f_value = @pins[idx-1] + val
            
            # if no strike check frame value should be =<10
            if ( @pins[idx-1] < 10)
                raise BowlingError, "fame_value is over 10" if f_value > 10    
            end
                  
            
            if f_value == 10    # spare
               @frames[f_id].status = 1
               @frames[f_id].count = 1
               @working << f_id
            end
         end
         
         # delete @working are done
         @working.delete_if { |f| @frames[f].count.zero? }
      end 
      
      # check if the @working is not empty, it means it premature throw
      p_size = @pins.size 
      if p_size == 19 || p_size == 20
         if (@pins.last == 10) || ((@pins[p_size-1] + @pins[p_size-2]) == 10 )
           raise BowlingError, "Need more throw, premature caculation." 
         end          
   end
      result    
   end 
   
   class BowlingError < StandardError
      puts "Kieu error"
   end     
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end



