require 'rails_helper'

RSpec.describe "RentalCategories", type: :request do
  describe "GET /rental_categories" do
    it "works! (now write some real specs)" do
      get rental_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
