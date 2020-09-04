class Prompt
    def greeting
        puts " "
        puts "Thank you for using the Food Pairing App for Beer".light_yellow
        puts " "
        puts "Please type in a food you have, that youd like to find beers to pair with.".light_green 
        puts " "
        puts "If you want to use multiple words in the search use _ between words (i.e,'chocolate_cake')".light_yellow
        puts " "
        puts "Please note that using the word 'chocolate' will find results for 'chocolate_cake', so try using single words.".light_yellow
        puts " "
        puts "Can't think of a food? Type one of the following to get started:".light_blue
        puts " "
        puts "'Chicken' 'Pork' 'Lime' or 'Chocolate'".light_blue
        puts " "
        puts "Type a word below...".light_green
        puts " "    
    end

    def intro_prompt
        puts " "
        puts "Type the word 'food' and hit Enter/Return to search by a different food".light_green
        puts " "
        puts "Type the word" + "'exit'".light_red + "and hit Enter/Return to leave the app.".light_red
        puts " "
    end

    def prompt
        puts " "
        puts "Type a number and hit Enter/Return to see a Beer's details, including meal ideas.".light_green
        puts " "
        puts "Type the word 'list' and hit Enter/Return to see your most recent search results again.".light_green
        puts " "
        puts "Type the word 'food' and hit Enter/Return to search by a different food".light_green
        puts " "
        puts "Type the word ".light_green + "'exit'".light_red + "and hit ".light_green + "Enter/Return ".light_red + "to leave the app.".light_green
        puts " "
    end
end