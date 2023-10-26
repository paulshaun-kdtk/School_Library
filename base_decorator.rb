require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    super() # This is required for linter checks
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
