require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

def list_books
  if Book.all_books.empty?
    puts 'There are no books in the library. Please add a book to list.'
  else
    puts "\nList of all books:"
    Book.all_books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end
end

def list_people
  if Person.all_people.empty?
    puts 'There are no people in the database. Please add a person to list.'
  else
    puts "\nList of all people (students and teachers):"
    Person.all_people.each do |person|
      puts "#{person.correct_name} (ID: #{person.id})"
    end
  end
end

def create_person
  puts "\nCreate a person (1. Student, 2. Teacher)"
  person_choice = gets.chomp.to_i
  print 'Enter name: '
  name = gets.chomp
  print 'Enter age: '
  age = gets.chomp.to_i

  if person_choice == 1
    new_person = Student.new(age, name: name)
  elsif person_choice == 2
    print 'Enter specialization: '
    specialization = gets.chomp
    new_person = Teacher.new(age, specialization, name: name)
  else
    puts 'Invalid choice. Please enter 1 for Student or 2 for Teacher.'
    return
  end

  Person.all_people << new_person
  puts "Created new person: #{new_person.correct_name} (ID: #{new_person.id})"
end

def create_book
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter author: '
  author = gets.chomp
  new_book = Book.new(title, author)
  puts "Created new book: #{new_book.title} by #{new_book.author}"
end

def create_rental
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  person = Person.find_by_id(person_id)
  if person
    print 'Enter book title: '
    title = gets.chomp
    book = Book.find_by_title(title)
    if book
      print 'Enter rental date (YYYY-MM-DD): '
      rental_date = Date.parse(gets.chomp)
      Rental.new(person, book, rental_date)
      puts 'Rental created successfully.'
    else
      puts 'Book not found.'
    end
  else
    puts 'Person not found.'
  end
end

def list_rentals
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  person = Person.find_by_id(person_id)
  if person
    puts "\nList of rentals for #{person.correct_name} (ID: #{person.id}):"
    person.rentals.each do |rental|
      puts "#{rental.book.title} (Rented on #{rental.date})"
    end
  else
    puts 'Person not found.'
  end
end

def display_menu
  puts "\nWelcome to the Library Console App!"
  puts 'Choose an option:'
  puts '1. List all books'
  puts '2. List all people (students and teachers)'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person ID'
  puts '7. Exit'
end

def handle_menu_choice(choice)
  menu_actions = {
    1 => method(:list_books),
    2 => method(:list_people),
    3 => method(:create_person),
    4 => method(:create_book),
    5 => method(:create_rental),
    6 => method(:list_rentals),
    7 => -> { puts 'Exiting the Library Console App. Goodbye!' }
  }

  action = menu_actions[choice]
  action&.call
  puts 'Invalid choice. Please select a valid option (1-7).' unless action
end
