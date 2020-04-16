class Cli
  def run
    puts " "
    puts "Thank you for using the Food Pairing App for Beer"
    puts " "
    puts "Please type in a food you have, that youd like to find beers to pair with." 
    puts "Can't think of a food? Type one of the following to get started:"
    puts " "
    puts "'Chicken' 'Pork' 'Lime' or 'Chocolate'"
    puts " "
    puts "Type a word below..."
    
    puts " "
    
    input = gets.strip.downcase
    
    Api.get_beer(input)
      food = Food.find_by_name(input)
      if food
        print_beers_by_food(food)
        puts " "
        prompt
      else
        puts " "
        puts "Unfortunately, we do not have a beer for that. Returning you to main menu..."
        intro_prompt
      end
    
   
    Api.get_beer(input)
    prompt
      input = gets.strip.downcase
        while input != 'exit'
            if input.to_i > 0 && input.to_i <= Beer.find_by_food(food).length
                beer = Beer.find_by_food(food)[input.to_i - 1]
                print_beer(beer)
            elsif input == "list"
                print_beers_by_food(food)
            elsif input == "food"
                puts " "
                puts "Please type a food and hit Enter/Return"
                puts " "
                input = gets.strip.downcase
                food = Food.find_by_name(input)
                if food
                    print_beers_by_food(food)
                else                
                    Api.get_beer(input)
                    food = Food.find_by_name(input)
                    if food
                        print_beers_by_food(food)
                    else
                        puts "Unfortunately, we do not have a beer for that. Returning you to main menu..."
                    end
                end
                
            else
                puts " "
                puts "Cannot process this request. Please try again"
            end
               prompt 
                input = gets.strip.downcase
            
        end       
        puts " "
        puts "Thank you for using the Food Pairing App for Beer. Goodbye!"
        puts " "
  end
  
  
    def prompt
      puts " "
      puts "Type a number and hit Enter/Return to see a Beer's details, including meal ideas."
      puts " "
      puts "Type the word 'list' and hit Enter/Return to see your most recent search results again."
      puts " "
      puts "Type the word 'food' and hit Enter/Return to search by a different food"
      puts " "
      puts "Type the word 'exit' and hit Enter/Return to leave the app."
      puts " "
    end
    
    def print_beers_by_food(food)
      puts " "
      puts "If you're making a meal with the food '#{food.name}', consider pairing with the following beers:"
      puts " "
      results = Beer.find_by_food(food)
      results.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name}"
      puts " "
      end
    end
end