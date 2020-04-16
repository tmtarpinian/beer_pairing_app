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
end