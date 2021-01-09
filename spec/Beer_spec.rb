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


end