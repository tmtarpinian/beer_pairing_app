class Printer
    #-----------------Iterates Beers Returned from Get request to API -------------------|
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
    #-----------------Prints Beers Details -------------------|
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