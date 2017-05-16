class RentalCategoriesController < ApplicationController
  before_action :set_rental_category, only: [:show, :update, :destroy]

  # GET /rental_categories
  def index
    @rental_categories = RentalCategory.all

    render json: @rental_categories
  end

  # GET /rental_categories/1
  def show
    render json: @rental_category
  end

  # POST /rental_categories
  def create
    @rental_category = RentalCategory.new(rental_category_params)

    if @rental_category.save
      render json: @rental_category, status: :created, location: @rental_category
    else
      render json: @rental_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rental_categories/1
  def update
    if @rental_category.update(rental_category_params)
      render json: @rental_category
    else
      render json: @rental_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rental_categories/1
  def destroy
    @rental_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_category
      @rental_category = RentalCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rental_category_params
      params.require(:rental_category).permit(:campground_id, :name)
    end
end
