class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_classroom(student)
    @students.push(student)
    student.classroom = self
  end
end
