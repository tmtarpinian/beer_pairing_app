class Api

  def self.get_beer(food)

    url = "https://api.punkapi.com/v2/beers?food=#{food}&per_page=80"
    response = Net::HTTP.get(URI(url))
    #binding.pry
    beers = JSON.parse(response)
        beers.each do |b| 
        new_beer = Beer.find_or_create_by_name(b["name"], b["description"], b["food_pairing"], b["abv"])
       
      end

    end

  end


 
end