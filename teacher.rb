require_relative './person'

class Teacher < Person
  def initailize(specialization)
    @specialization = specialization
  end

  def can_use_services?
    TRUE
  end

END
