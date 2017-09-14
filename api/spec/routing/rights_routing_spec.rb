require "rails_helper"

RSpec.describe Api::V1::RightsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/campgrounds/1/rights").to route_to("api/v1/rights#index", :campground_id => "1")
    end


    it "routes to #show" do
      expect(:get => "v1/campgrounds/1/rights/1").to route_to("api/v1/rights#show", :campground_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "v1/campgrounds/1/rights").to route_to("api/v1/rights#create", :campground_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "v1/campgrounds/1/rights/1").to route_to("api/v1/rights#update", :campground_id => "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "v1/campgrounds/1/rights/1").to route_to("api/v1/rights#update", :campground_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "v1/campgrounds/1/rights/1").to route_to("api/v1/rights#destroy", :campground_id => "1", :id => "1")
    end

  end
end
