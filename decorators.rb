require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  MAX_LENGTH = 10

  def correct_name
    trimmed_name = @nameable.correct_name[0, MAX_LENGTH]
    trimmed_name.length == MAX_LENGTH ? trimmed_name : "#{trimmed_name}..."
  end
end



