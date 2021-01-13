class Food
    
  attr_accessor :name, :beers

  @@all = []

  def initialize(name)
    @name = name
    @beers = []
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.create(food)
    food = self.new(food)
    food.save
  end

  def self.find_or_create_by_name(name)
    food = self.find_by_name(name)
    food ? food : self.create(name)
  end

  def self.find_by_name(name)
    self.all.find{|i| i.name == name}
  end

  def self.delete_all
    @@all = []
  end

end