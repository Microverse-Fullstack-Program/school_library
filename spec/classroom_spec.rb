require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'create a classroom' do
    classroom = Classroom.new('ruby language')

    it 'show classroom' do
      expect(classroom.label).to eq 'ruby language'
    end
  end
end

describe '#Create test for add_student method' do
  before :each do
    @classroom = Classroom.new 'Data Structure'
  end
  it 'Should return two student' do
    # create two students
    marc = Student.new(16, 'Marc', false)
    rita = Student.new(19, 'Rita', false)

    # add the students to the classroom
    @classroom.add_classroom(marc)
    @classroom.add_classroom(rita)
  end

  it 'Should return the classroom of the student' do
    marc = Student.new(23, 'Marc', true)
    @classroom.add_classroom(marc)
    expect(marc.classroom).to eql @classroom
  end
end
