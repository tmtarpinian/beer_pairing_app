require_relative './Prompt'

class Cli 
  
  def run
    Prompt.new.greeting
      
    input = gets.strip.downcase
    Api.get_beer(input)
    food = Food.find_by_name(input)
      if food
        print_beers_by_food(food)
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
        print_beer(beer)
        puts " "
        Prompt.new.prompt
      elsif input == "list"
        print_beers_by_food(food)
        Prompt.new.prompt
      elsif input == "food"
        puts " "
        puts "Please type a food and hit Enter/Return".light_green
        puts " "
        input = gets.strip.downcase
        food = Food.find_by_name(input)
          if food
            print_beers_by_food(food)
            Prompt.new.prompt
          else                
            Api.get_beer(input)
            food = Food.find_by_name(input)
            if food
              print_beers_by_food(food)
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

  def print_beers_by_food(food)
    puts " "
    puts "If you're making a meal with the food '#{food.name}', consider pairing with the following beers:".light_yellow
    puts " "
    results = Beer.find_by_food(food)
      results.each.with_index(1) do |beer, i|
        puts "#{i}. #{beer.name}".light_blue
        puts " "
      end
  end

  def print_beer(beer)
    puts " "
    puts "#{beer.name} has an ABV of ".light_blue +  "#{beer.abv}.".light_red
    puts " "
    puts "Description: ".light_blue + "#{beer.description}".light_yellow
    puts " "
    puts "#{beer.name} pairs well with the following meals: ".light_blue + "#{beer.meals}.".light_yellow
    puts " "
    puts "Have an ingredient from one of the meals above? Try using that in your next search!"
    puts " "
    puts " "
  end
end
