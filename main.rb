require_relative './lib/app'
require_relative './lib/menu'

def main
  app = App.new
  menu = Menu.new(app)

  puts '
    Welcome to Catalog of my Things app!'

    loop do
    menu.display_options

    choice = gets.chomp.to_i
    menu.perform_action(choice)
  end
end

main
