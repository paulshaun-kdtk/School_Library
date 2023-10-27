class Rental
  attr_accessor :date, :person, :book

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
    book.rentals << self
    person.rentals << self
  end
end
