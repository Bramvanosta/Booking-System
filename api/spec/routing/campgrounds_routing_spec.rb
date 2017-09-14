require "rails_helper"

RSpec.describe Api::V1::CampgroundsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/campgrounds").to route_to("api/v1/campgrounds#index")
    end


    it "routes to #show" do
      expect(:get => "v1/campgrounds/1").to route_to("api/v1/campgrounds#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "v1/campgrounds").to route_to("api/v1/campgrounds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "v1/campgrounds/1").to route_to("api/v1/campgrounds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "v1/campgrounds/1").to route_to("api/v1/campgrounds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "v1/campgrounds/1").to route_to("api/v1/campgrounds#destroy", :id => "1")
    end

  end
end
