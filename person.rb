require_relative 'decorators/nameable'
require_relative 'decorators/capitalize_decorator'
require_relative 'decorators/trimmer_decorator'
require 'date'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def rent(book, date)
    rental = Rental.new(self, book, date)
    @rentals << rental
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1_000_000)
  end
end
