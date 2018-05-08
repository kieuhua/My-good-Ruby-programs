class ETL
  class << self
    def transform(old)
       new_hsh = {}
       old.each do |point, letters|        
         letters.collect do |letter| 
             new_hsh[letter.downcase] = point
          end
       end
       new_hsh
    end
  end
end

 old = {
   1 => ["A", "E"],
   2 => ["D", "G"]
 }
p ETL.transform(old)

=begin
# old system
- 1 point: "A", "E", "I", "O", "U", "L", "N", "R", "S", "T",
- 2 points: "D", "G",
- 3 points: "B", "C", "M", "P",
- 4 points: "F", "H", "V", "W", "Y",
- 5 points: "K",
- 8 points: "J", "X",
- 10 points: "Q", "Z",

# new system, case insensitive
- "a" is worth 1 point.
- "b" is worth 3 points.
- "c" is worth 3 points.
- "d" is worth 2 points.
- Etc.


 old = {
   1 => ["A", "E", "I", "O", "U"]
 }
 expected = {
   'a' => 1,
   'e' => 1,
   'i' => 1,
   'o' => 1,
   'u' => 1
 }
=end