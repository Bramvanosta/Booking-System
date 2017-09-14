require "rails_helper"

RSpec.describe Api::V1::ClientsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/campgrounds/1/clients").to route_to("api/v1/clients#index", :campground_id => "1")
    end


    it "routes to #show" do
      expect(:get => "v1/campgrounds/1/clients/1").to route_to("api/v1/clients#show", :campground_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "v1/campgrounds/1/clients").to route_to("api/v1/clients#create", :campground_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "v1/campgrounds/1/clients/1").to route_to("api/v1/clients#update", :campground_id => "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "v1/campgrounds/1/clients/1").to route_to("api/v1/clients#update", :campground_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "v1/campgrounds/1/clients/1").to route_to("api/v1/clients#destroy", :campground_id => "1", :id => "1")
    end

  end
end
