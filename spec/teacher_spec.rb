require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('CS', 30, 'John Doe')
  end

  context 'creating a student' do
    it 'instantiate an object ' do
      expect(@teacher).to be_instance_of(Teacher)
    end
  
    it 'returns the student age' do
      expect(@teacher.age).to eql 30
    end

    it 'returns the student name' do
      expect(@teacher.name).to eql 'John Doe'
    end

    it 'returns the student specialization' do
      expect(@teacher.specialization).to eql 'CS'
    end
  end

  context 'when can_use_service? method is called' do
    it 'return true or false' do
      expect(@teacher.can_use_services?).not_to be false
    end
  end
end
