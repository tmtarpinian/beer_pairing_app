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