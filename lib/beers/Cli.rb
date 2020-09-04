require_relative './Prompt'
require_relative './Printer'

class Cli 
  
  def run
    Prompt.new.greeting
      
    input = gets.strip.downcase
    Api.get_beer(input)
    food = Food.find_by_name(input)
      if food
        Printer.new.print_beers_by_food(food)
        puts " "
        Prompt.new.prompt
      else
        puts " "
        puts "Unfortunately, we do not have a beer for that. Returning you to main menu...".light_red
        Prompt.new.intro_prompt
      end
      
    input = gets.strip.downcase
    while input != 'exit'
      if input.to_i > 0 && input.to_i <= Beer.find_by_food(food).length
        beer = Beer.find_by_food(food)[input.to_i - 1]
        Printer.new.print_beer(beer)
        puts " "
        Prompt.new.prompt
      elsif input == "list"
        Printer.new.print_beers_by_food(food)
        Prompt.new.prompt
      elsif input == "food"
        puts " "
        puts "Please type a food and hit Enter/Return".light_green
        puts " "
        input = gets.strip.downcase
        food = Food.find_by_name(input)
          if food
            Printer.new.print_beers_by_food(food)
            Prompt.new.prompt
          else                
            Api.get_beer(input)
            food = Food.find_by_name(input)
            if food
              Printer.new.print_beers_by_food(food)
              Prompt.new.prompt
            else
              puts "Unfortunately, we do not have a beer for that. Returning you to main menu...".light_red
              Prompt.new.intro_prompt
            end
          end
      else
        puts " "
        puts "Cannot process this request. Please try again".light_red
        Prompt.new.intro_prompt
      end
    input = gets.strip.downcase
    end       
    puts " "
    puts "Thank you for using the Food Pairing App for Beer. Goodbye!".light_yellow
    puts " "
  end

end
