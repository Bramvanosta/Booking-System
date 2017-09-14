require "rails_helper"

RSpec.describe Api::V1::RentalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/campgrounds/1/rental_categories/1/rentals").to route_to("api/v1/rentals#index", :campground_id => "1", :rental_category_id => "1")
    end


    it "routes to #show" do
      expect(:get => "v1/campgrounds/1/rental_categories/1/rentals/1").to route_to("api/v1/rentals#show", :campground_id => "1", :rental_category_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "v1/campgrounds/1/rental_categories/1/rentals").to route_to("api/v1/rentals#create", :campground_id => "1", :rental_category_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "v1/campgrounds/1/rental_categories/1/rentals/1").to route_to("api/v1/rentals#update", :campground_id => "1", :rental_category_id => "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "v1/campgrounds/1/rental_categories/1/rentals/1").to route_to("api/v1/rentals#update", :campground_id => "1", :rental_category_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "v1/campgrounds/1/rental_categories/1/rentals/1").to route_to("api/v1/rentals#destroy", :campground_id => "1", :rental_category_id => "1", :id => "1")
    end

  end
end
