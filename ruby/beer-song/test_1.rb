class BeerSong

  def verse(num)   
    return process_bottles(num)   
  end
  
  def verses(num1, num2)
    output=""
   (num2..num1).reduce(output) { |output, num|  output << process_bottles(num) + "\n" }
    output.delete_suffix!("\n\n")
  end
  
 
  def process_bottles(num)
    case num
    when 0 
      output = <<-TEXT 
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
TEXT
    when 1
      output = <<-TEXT 
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
TEXT
    when 2
      output = <<-TEXT 
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
TEXT
    else
      output = <<-TEXT 
#{num} bottles of beer on the wall, #{num} bottles of beer.
Take one down and pass it around, #{num - 1} bottles of beer on the wall.
TEXT
    end  
  end # end of process_bottles
  
end

p BeerSong.new.verses(99, 98)