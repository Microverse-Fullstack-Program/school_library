class Person
  def initialize (age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getter methods
  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  # setter methods
  def id=(id)
    @id=id
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age = age
  end

  # private method
  def of_age?
    return true if @age >= 18
    false
  end
  private :of_age

  # public method
  def can_use_services?
    return true if of_age || @parent_permission
  end

END
