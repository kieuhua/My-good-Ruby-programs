h1 = {c: 3, d: 4, a: 1, b: 6}
>> Hash[h1.sort]
=> {:a=>1, :b=>6, :c=>3, :d=>4}
h1.sort.to_h

class School
   def initialize
      @students = {}    # {:name => grade}  student name is uniq
   end
   def students(grade)
      list = []
      @students.each do |name, gr|
         list << name if gr == grade
      end
      list.sort 
   end
   def add(name, grade)
      @students[name] = grade
   end
   
   def students_by_grade
      return [] if @students.empty?
      # array of hash
      # return [ { grade: 6, students: studends.sort }]
      students_body = []
      # group students by grade
      hsh_gr = {}
      @students.each do |name, gr|
         if hsh_gr.key?(gr)
            hsh_gr[gr] = hsh_gr[gr] << name
         else
            hsh_gr[gr] = [name] 
         end
      end
      # create the desired output
      # expected = [{ grade: grade, students: students.sort }]
      expected = []
      hsh_gr.each do |gr, students|    
         ahash =  {:grade => gr, :studends => students.sort} 
         expected << ahash
      end
      expected
   end
end

def everyone
   [
     { grade: 3, students: %w(Deemee Eeemee) },
     { grade: 1, students: %w(Effmee Geemee) },
     { grade: 2, students: %w(Aimee Beemee Ceemee) }
   ]
 end
 
 def everyone_sorted
     [
       { grade: 1, students: %w(Effmee Geemee) },
       { grade: 2, students: %w(Aimee Beemee Ceemee) },
       { grade: 3, students: %w(Deemee Eeemee) }
     ]
   end


    school = School.new
    everyone.each do |grade|
      grade[:students].each { |student| school.add(student, grade[:grade]) }
    end
    p expected = everyone_sorted
    p school.students_by_grade
  
# assert_equal expected, school.students_by_grade

#[{:grade=>1, :students=>["Effmee", "Geemee"]}, {:grade=>2, :students=>["Aimee", "Beemee", "Ceemee"]}, 
#{:grade=>3, :students=>["Deemee", "Eeemee"]}]


[[{:grade=>3}, {:studends=>["Deemee", "Eeemee"]}], [{:grade=>1}, {:studends=>["Effmee", "Geemee"]}], 
[{:grade=>2}, {:studends=>["Aimee", "Beemee", "Ceemee"]}]]
 

  