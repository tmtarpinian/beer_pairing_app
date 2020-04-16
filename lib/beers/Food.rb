class Food
    
    attr_accessor :name, :beers

    @@all = []

    def initialize(name)
        @name = name
        @beers = []
        @@all << self
    end

    def self.all
        @@all
    end



    def self.create(food)
        food = self.new(food)
    end



    def self.find_or_create_by_name(name)
        food = self.find_by_name(name)
        if food
        food
        else
        self.create(name) 
        end
    end

  

    def self.find_by_name(name)
        self.all.find{|i| i.name == name}
    end

end