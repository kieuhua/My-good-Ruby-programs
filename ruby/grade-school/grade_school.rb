# Given students' names along with the grade that they are in, create a roster
# for the school. More details in README.md
class School
  def initialize
    @students = {} # {:name => grade}  student name is uniq
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

    # group students by grade
    hsh_gr = {}
    @students.each do |name, gr|
      if hsh_gr.key?(gr)
        hsh_gr[gr] = hsh_gr[gr] << name
      else
        hsh_gr[gr] = [name]
      end
    end

    hsh_gr_sorted = hsh_gr.sort.to_h
    result = []
    hsh_gr_sorted.each do |gr, students|
      ahash = { :grade => gr, :students => students.sort }
      result << ahash
    end
    result
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

