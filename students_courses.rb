class Student

  attr_reader :courses, :fname, :lname

  def initialize(f_name,l_name)
    @first_name = f_name
    @last_name = l_name
    @courses = []
  end

  def name
    @f_name + @l_name
  end

  def courses
    self.courses
  end

  def enroll(course)
  return if courses.include?(course)


  self.courses << course#take a course object, add to list of courses,

    course.students << self
  end

  def course_load
   load = {}

   self.courses.each do |course|
     load[course.department] += num_credits
   end
  end

end

class Course

  attr_reader :name, :department, :num_credits, :students

  def initialize(name,department,num_credits)
    @name = name
    @department = department
    @num_credits = num_credits
    @students = []
  end

  def students
    self.students
  end

  def add_student(student)
    student.enroll(self)
  end
end
