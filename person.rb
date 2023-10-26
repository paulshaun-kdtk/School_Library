require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super() # this is required for linter checks
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1_000_000)
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    super() # This is required for linter checks
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


person = Person.new(22, name: 'maximilianus')
puts person.correct_name
# Output: maximilianus
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
# Output: Maximilianus
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
# Output: Maximilian..
