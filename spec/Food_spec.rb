require "spec_helper"

RSpec.describe Food, type: :model do
  
  context "instance methods" do
    
    describe "#initialize" do
     
      it "it initializes an instance of a Food" do
				new_food = Food.new("Raspberry")
				expect(new_food.class.name).to eq("Food")
      end

			it "can set the name of a food" do
				new_food = Food.new("Raspberry")
				expect(new_food.name).to eq("Raspberry")
			end
    end

    describe "#beers" do
			new_food = Food.new("Raspberry")
			beer_1 = Beer.create("Norm's Raggedy Ass IPA", "Our flagship - 2010 World Beer Cup gold medal award - brewed and hopped with American, Centennial, Cascades, Columbus and Simcoe hops", ["Buffalo Wings", "Pad Thai"], "7.2%") 
			beer_2 = Beer.create("Tank 7", "Fruity Aromatics, citrusy balance, dry and hoppy perfection", ["Raspberry Tort", "Chile Lime Quesadillas"], "8.5%")
	
			it "can set beers for a food" do
				new_food.beers << [beer_1, beer_2]
				expect(new_food.beers.flatten.length).to eq(2)
				
			end

			it "can call the beers of a food" do
				expect(new_food.beers.flatten.last.name).to eq("Tank 7")
			end
		end

		describe "#save" do
			it "can save an instance of a food in the @@all array" do
				new_food = Food.new("Raspberry")
				new_food_2 = Food.new("Lime")
				new_food_2.save
				expect(Food.all.last).to eq(new_food_2)
			end
		end

	end

	context "class methods" do

		describe ".all" do
					
		it "contains all food instances in memory as an array" do
			Food.delete_all
			food_1 = Food.create("Raspberry")
			food_2 = Food.create("Lime")
			expect(Food.all).to include(food_2)
		end
			end

			describe ".create" do
		it "successfully instantiates and saves a new Food instance" do
			created_food = Food.create("Lime")
			expect(Food.all).to include(created_food)
		end
		end
		
		describe ".find_by_name" do
			it "finds a Food instance by a given name" do
			Food.delete_all
			food_1 = Food.create("Raspberry")
			food_2 = Food.create("Lime")
			name = "Lime"
			found_food = Food.find_by_name(name)
			expect(found_food).to be(food_2) 
			end
		end
	end
end