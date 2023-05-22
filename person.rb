class Person
  def initialize (name = ""Unknown"", age, parent_permission = true)
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
  
end
