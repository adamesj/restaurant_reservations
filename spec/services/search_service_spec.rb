require 'rails_helper'


describe SearchService, :type => :service do
  describe '#search' do
    before do
      @japanese_category = Category.create(name: "Japanese")
      @mexican_category = Category.create(name: "Mexican")
      @mexican_restaurant = Restaurant.create(name: "Mexican Spot", address: "155 Menahan Street, Brooklyn, NY 11234")
      @sushi_restaurant = Restaurant.create(name: "Sushi Spot", address: "44 Astoria Blvd, Queens, NY 22222")
      @mexican_restaurant.categories << @mexican_category
      @sushi_restaurant.categories << @japanese_category
    end

    it "returns a match on restaurant name" do
      expect(SearchService.search("Mexican")).to eq([@mexican_restaurant])
    end
    it "returns a match on category name" do
      expect(SearchService.search("Japanese")).to eq([@sushi_restaurant])
    end
    it "returns unique matches" do
      expect(SearchService.search("Mexican")).to eq([@mexican_restaurant])
    end
    it "returns matches on partial words" do
    end
    it "returns an empty array for no matches" do
    end
  end
end