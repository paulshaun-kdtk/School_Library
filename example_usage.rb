require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# Create some persons
person1 = Person.new(20, name: 'John')
person2 = Person.new(15, name: 'Jane', parent_permission: true)

# Create a book
book1 = Book.new('Introduction to Ruby', 'Ruby Author')

# Check if persons can use services
puts person1.can_use_services? #=> true
puts person2.can_use_services? #=> true

# Rent a book to a person
date = Date.new(2023, 10, 27)
person1.rent(book1, date)

# Check rentals
puts person1.rentals[0].book.title # Should output "Introduction to Ruby"
puts person1.rentals[0].date # Should output "2023-10-27"

# Create a teacher
teacher1 = Teacher.new(30, 'Math', name: 'Mr. Smith')

# Rent a book to a teacher
date = Date.new(2023, 10, 28)
teacher1.rent(book1, date)

# Check rentals
puts teacher1.rentals[0].book.title # Should output "Introduction to Ruby"
puts teacher1.rentals[0].date # Should output "2023-10-28"
