require_relative '../student'
require_relative '../teacher'

module CreatePerson
  def create_person(persons, role)
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    if role == 'student'
      print 'classroom: '
      classroom = gets.chomp
      print 'Has parent permission? (Y/N): '
      permission = gets.chomp
      persons << Student.new(classroom, age, name, parent_permission: permission)
    elsif role == 'teacher'
      print 'Specialization: '
      specialization = gets.chomp
      persons << Teacher.new(specialization, age, name)
    end
    puts 'Person created successfully: '
  end
end
