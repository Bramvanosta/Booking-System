require "rails_helper"

RSpec.describe RentalCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rental_categories").to route_to("rental_categories#index")
    end


    it "routes to #show" do
      expect(:get => "/rental_categories/1").to route_to("rental_categories#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/rental_categories").to route_to("rental_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rental_categories/1").to route_to("rental_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rental_categories/1").to route_to("rental_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rental_categories/1").to route_to("rental_categories#destroy", :id => "1")
    end

  end
end
