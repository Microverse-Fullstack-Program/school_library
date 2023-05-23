require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
  end

  def correct_name
    length = @nameable.correct_name.length
    return @nameable.correct_name[0...10] if length > 10

    @nameable.correct_name
  end
end
