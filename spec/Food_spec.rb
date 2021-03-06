require "spec_helper"

RSpec.describe Food, type: :model do
	let!(:food_one) {Food.create("Raspberry")}
	let!(:food_two) {Food.create("Lime")}
	let!(:beer_one) {Beer.create("Norm's Raggedy Ass IPA", "Our flagship - 2010 World Beer Cup gold medal award - brewed and hopped with American, Centennial, Cascades, Columbus and Simcoe hops", ["Buffalo Wings", "Pad Thai"], "7.2%") }
	let!(:beer_two) {Beer.create("Tank 7", "Fruity Aromatics, citrusy balance, dry and hoppy perfection", ["Raspberry Tort", "Chile Lime Quesadillas"], "8.5%")}
  
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
			it "can set beers for a food" do
				new_food.beers << [beer_one, beer_two]
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
		
		after(:each) do
			Food.delete_all
		end

		describe ".all" do			
			it "contains all food instances in memory as an array" do
				expect(Food.all).to include(food_two)
			end
		end

		describe ".create" do
			it "successfully instantiates and saves a new Food instance" do
				created_food = Food.create("Salsa")
				expect(Food.all).to include(created_food)
			end
		end
		
		describe ".find_by_name" do
			it "finds a Food instance by a given name" do
				name = "Lime"
				found_food = Food.find_by_name(name)
				expect(found_food).to be(food_two)
			end
		end

		describe ".find_or_create_by_name" do
			
			it "finds, does not recreate, an existing Food instance by a given name" do
				name = "Lime"
				found_food = Food.find_or_create_by_name(name)
				expect(found_food).to be(food_two) 
				expect(Food.all.length).to be(2)
			end

			it "creates a new Food instance if one is not found by name" do
				name = "Chocolate"
				new_food = Food.find_or_create_by_name(name)
				expect(new_food).to be(Food.all.last) 
				expect(Food.all.length).to be(3)
			end
		end

		describe ".delete_all" do
			it "deletes food instances from @@all array" do
				expect(Food.all.length).to eq(2) 
			  	Food.delete_all
			  	expect(Food.all).to match_array([]) 
			end
		end
	end
end