require_relative './base_decorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
  end

  def correct_name
    @nameable.correct_name.upcase
  end
end
