require "rspec"
require "dessert"

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:type) { double("type") }

  subject(:dessert) do
    Dessert.new(type, 2, chef)
  end

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq(type)
    end

    it "sets a quantity" do
      expect(dessert.quantity.class).to be(Integer)
      expect(dessert.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        Dessert.new(type, "hi", chef)
      end.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("milk")
      dessert.add_ingredient("eggs")
      original = dessert.ingredients.dup
      dessert.mix!
      expect(dessert.ingredients).to_not eq(original)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      original = dessert.quantity
      dessert.eat(1)
      expect(dessert.quantity).to_not eq(original)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        dessert.eat(3)
      end.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Alisa")
      expect(type).to receive(:pluralize).and_return("Cakes")
      expect(dessert.serve).to include("Alisa")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
