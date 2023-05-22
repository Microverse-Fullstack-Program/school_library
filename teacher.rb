require_relative "./person"

class Teacher < Person
  def initailize(specialization)
    @specialization = specialization 
  end

end
