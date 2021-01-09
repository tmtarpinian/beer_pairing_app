require "spec_helper"

describe "Beer" do
  let(:beer_1) {Beer.new("Norm's Raggedy Ass IPA", "Our flagship - 2010 World Beer Cup gold medal award - brewed and hopped with American, Centennial, Cascades, Columbus and Simcoe hops", ["Buffalo Wings", "Pad Thai"], "7.2%") }
  let(:beer_2) {Beer.new("Tank 7", "Fruity Aromatics, citrusy balance, dry and hoppy perfection", ["Raspberry Tort", "Chile Lime Quesadillas"], "8.5%")}
  
  describe "#initialize" do
    it "new beer objects can call their attributes" do
      #new_beer = Beer.new("Tank 7", "Fruity Aromatics, citrusy balance, dry and hoppy perfection", ["Raspberry Tort", "Chile Lime Quesadillas"], "8.5%")
      new_beer_name = beer_2.instance_variable_get(:@name)
      expect(new_beer_name).to eq("Tank 7")
      expect(beer_1.abv).to eq("7.2%")
    end
  end

  describe "#name" do
    it "can call the name of a beer" do
      expect(beer_2.name).to eq("Tank 7")
    end
  end

  describe "#description" do
    it "can call the description of a beer" do
      expect(beer_1.description).to eq("Our flagship - 2010 World Beer Cup gold medal award - brewed and hopped with American, Centennial, Cascades, Columbus and Simcoe hops")
    end
  end

  describe "#abv" do
    it "can call the abv of a beer" do
      expect(beer_2.abv).to eq("8.5%")
    end
  end

  describe "#meals" do
    it "can call the meals of a beer" do
      expect(beer_1.meals).to eq("Buffalo Wings, Pad Thai")
    end
  end

  describe ".all" do
    
    it "saves all beer instances in memory as an array" do
      expect(Beer.all).to include(beer_2)
    end
  end

  describe ".create" do
    it "successfully instantiates and saves a new Beer instance" do
      created_beer = Beer.create("Labatt Blue", "Canadian Pilsner", ["Hockey"], "5.0%")
      expect(Beer.all).to include(created_beer) 
    end
  end

  describe ".save" do
    it "successfully saves a new Beer instance" do
      new_beer = Beer.new("Labatt Blue", "Canadian Pilsner", ["Hockey"], "5.0%")
      new_beer.save
      expect(Beer.all).to include(new_beer) 
    end
  end
end