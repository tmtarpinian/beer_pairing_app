class Api

  def self.get_beer(food)
    url = "https://api.punkapi.com/v2/beers?food=#{food}&per_page=80"
    beers = JSON.parse(Net::HTTP.get(URI(url)))
    if beers.length > 0
      new_food = Food.find_or_create_by_name(food)
      beers.each do |beer| 
        new_beer = Beer.find_or_create_by_name(beer["name"], b["description"], beer"food_pairing"], beer["abv"])
        new_food.beers << new_beer #will this create duplicates?
        new_beer.foods << new_food
      end
    end
  end
  
end