require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  # let(:chef) { double("chef", name: "Bob") }
  let(:chef) { double("chef", name: "Tucker") }
  subject(:dessert) { Dessert.new("cake", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(subject.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients.empty?).to be true
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "five", :chef) }.to raise_error("No go")
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      subject.add_ingredient("GF flour")
      expect(subject.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      subject.add_ingredient("GF flour")
      subject.add_ingredient("almond milk")
      subject.add_ingredient("brown sugar")
      subject.add_ingredient("torpedo")
      subject.add_ingredient("toenails")
      subject.add_ingredient("cigar butts")
      pre_mix = subject.ingredients.dup
      expect(subject.mix!).to_not eq(pre_mix)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      subject.eat(50)
      expect(subject.quantity).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {subject.eat(150) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bob the Great Baker")
      expect(dessert.serve).to eq("Chef Bob the Great Baker has made 100 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      # expect(dessert.make_more.to_not raise_error
      dessert.make_more
    end
  end
end

# 