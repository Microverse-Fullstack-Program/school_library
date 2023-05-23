require_relative './BaseDecorator'

class TrimmerDecorator < BaseDecorator

  def initialize (nameable)
    @nameable = nameable
  end

  def correct_name
    length = @nameable.correct_name.length
    return @nameable.correct_name[0...10] if length > 10
    @nameable.correct_name
  end
end