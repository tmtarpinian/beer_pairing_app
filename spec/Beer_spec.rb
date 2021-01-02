require "spec_helper"

describe "Beer" do
  let(:song) { Song.new("In the Aeroplane Over the Sea") }

  describe "#initialize" do
    it "accepts a name, description, array of meals, and abv for the new beer" do
      new_beer = Beer.new("Tank 7", "Fruity Aromatics, citrusy balance, dry and hoppy perfection", ["Raspberry Tort", "Chile Lime Quesadillas"], "8.5%")

      new_beer_name = new_beer.instance_variable_get(:@name)

      expect(new_beer_name).to eq("Tank 7")
    end
  end
end