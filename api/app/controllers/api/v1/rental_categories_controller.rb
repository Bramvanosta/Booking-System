module Api::V1
  class RentalCategoriesController < ApiController
    before_action :set_rental_categories, only: [:index]
    before_action :set_rental_category, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /rental_categories
    def index
      if @access_rights.can_view_campground?
        render json: @rental_categories
      else
        error_message = I18n.t 'errors.rights.rental_categories.view'
        render json: {error: error_message}, status: 401
      end
    end

    # GET /rental_categories/1
    def show
      if @access_rights.can_view_campground?
        render json: @rental_category
      else
        error_message = I18n.t 'errors.rights.rental_categories.view'
        render json: {error: error_message}, status: 401
      end
    end

    # POST /rental_categories
    def create
      if @access_rights.can_edit_campground?
        @rental_category = RentalCategory.new(rental_category_params)

        if @rental_category.save
          render json: @rental_category, status: :created, location: @rental_category
        else
          render json: @rental_category.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.rental_categories.create'
        render json: {error: error_message}, status: 401
      end
    end

    # PATCH/PUT /rental_categories/1
    def update
      if @access_rights.can_edit_campground?
        if @rental_category.update(rental_category_params)
          render json: @rental_category
        else
          render json: @rental_category.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.rental_categories.edit'
        render json: {error: error_message}, status: 401
      end
    end

    # DELETE /rental_categories/1
    def destroy
      if @access_rights.can_edit_campground?
        @rental_category.destroy
      else
        error_message = I18n.t 'errors.rights.rental_categories.delete'
        render json: {error: error_message}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_categories
      @rental_categories = Campground.find(params[:campground_id]).rental_categories
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rental_category
      @rental_category = RentalCategory.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def rental_category_params
      params.require(:rental_category).permit(:campground_id, :name)
    end
  end
end
