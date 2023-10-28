require_relative 'app'

def main
  loop do
    display_menu
    choice = gets.chomp.to_i
    handle_menu_choice(choice)
    break if choice == 7
  end
end

# function call to initialize the app
main
