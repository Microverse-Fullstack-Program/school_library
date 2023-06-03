require_relative '../student'
require_relative '../rental'

describe Student do
  before(:each) do
    @student = Student.new('class1', 16, 'John', parent_permission: true)
  end

  context 'creating a student' do
    it 'returns the student age' do
      expect(@student.age).to eql 16
    end

    it 'returns the student name' do
      expect(@student.name).to eql 'John'
    end

    it 'returns true for can_use_services? when the student has parent permission' do
      expect(@student.can_use_services?).to eql true
    end

    it 'returns false for can_use_services? when the student does not have parent permission and is underage' do
      student = Student.new('class2', 16, 'Jane', parent_permission: false)
      expect(student.can_use_services?).to eql false
    end

    it 'returns true for can_use_services? when the student is of age and does not have parent permission' do
      student = Student.new('class3', 19, 'Mike', parent_permission: false)
      expect(student.can_use_services?).to eql true
    end

    it 'returns true for can_use_services? when the student is underage and does have parent permission' do
      student = Student.new('class3', 14, 'Mike', parent_permission: true)
      expect(student.can_use_services?).to eql true
    end
  end

  context 'miscellaneous' do
    it 'returns a shrug emoji when the student plays hooky' do
      expect(@student.play_hooky).to eql '¯(ツ)/¯'
    end

    it 'notifies upon student creation' do
      expect do
        Student.new('class', 17, 'Alice', parent_permission: false)
      end.to output("Student Alice enrolled\n").to_stdout
    end
  end
end
