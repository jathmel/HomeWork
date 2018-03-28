# require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) { Dessert.new("cake", 2, chef) }
  let(:chef) { double("chef", name: "Matt") }
  # let(:desert) { Desert.new(cake, 0, 'ryan') }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq('cake')
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "3", "Chef")}.to raise_error("ArgumentError")
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.add_ingredient('flour')).to eq(['flour'])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      arr = ["flour", "eggs", "sugar"]
      expect(arr).to eq(arr.shuffle)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cake.eat(1)).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cake.eat(3)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Matt")
      expect(cake.serve).to eq('Matt has made 2 cakes!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
