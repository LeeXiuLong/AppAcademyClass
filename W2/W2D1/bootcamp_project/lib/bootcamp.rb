class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan 
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    #How to make a hash with default values as empty arrays
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
        @students << student
        return true
    end

    false
    end

    def enrolled?(student)
        return students.include?(student)
    end

    def student_to_teacher_ratio()
        return (students.length/teachers.length)
    end

    def add_grade(student, n)    
        return false if !enrolled?(student)

        @grades[student] << n
        true
    end

    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        return nil if @grades[student] == [] || !enrolled?(student)
        return @grades[student].sum/@grades[student].length
    end
end
