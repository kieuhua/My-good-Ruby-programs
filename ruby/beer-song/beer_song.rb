# Recite the lyrics to that beloved classic, that field-trip favorite:
# 99 Bottles of Beer on the Wall.
class BeerSong
  def verse(num)
    process_bottles(num)
  end

  def verses(num1, num2)
    output_a = []
    (num2..num1).reduce(output_a) { |_, e|  output_a << process_bottles(e) + "\n" }
    output_a.reverse.join.chop
  end

  def process_bottles(num)
    case num
    when 0
<<-TEXT
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
TEXT
    when 1
<<-TEXT
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
TEXT
    when 2
<<-TEXT
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
TEXT
    else
<<-TEXT
#{num} bottles of beer on the wall, #{num} bottles of beer.
Take one down and pass it around, #{num - 1} bottles of beer on the wall.
TEXT
    end
  end # end of process_bottles
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
