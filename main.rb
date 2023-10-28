require_relative 'app'

def main
  while true
    puts "\nWelcome to the Library Console App!"
    puts 'Choose an option:'
    puts '1. List all books'
    puts '2. List all people (students and teachers)'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person ID'
    puts '7. Exit'

    choice = gets.chomp.to_i

    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts 'Exiting the Library Console App. Goodbye!'
      break
    else
      puts 'Invalid choice. Please select a valid option (1-7).'
    end
  end
end

# function call to instantialize app
main
