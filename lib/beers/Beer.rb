class Beer

    attr_accessor :name, :description, :meals, :abv, :foods

    @@all = []

    def initialize (name, description, meals, abv)
        @name = name
        @description = description
        @meals = meals.join(", ")
        @abv = abv
        @foods = []
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create(name, description, meals, abv)
        beer = self.new(name, description, meals, abv)
    end

    def self.find_by_name(name)
        self.all.find{|i| i.name == name}
    end

    def self.find_or_create_by_name(name, description, meals, abv)
        beer = self.find_by_name(name)
        if beer
            beer
        else
            self.create(name, description, meals, abv) 
        end
    end

    def self.find_by_food(food)
        self.all.select{|beer| beer.foods.include?(food)}
    end
  
end