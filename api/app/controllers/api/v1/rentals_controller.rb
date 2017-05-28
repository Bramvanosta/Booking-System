module Api::V1
  class RentalsController < ApiController
    before_action :set_rentals, only: [:index]
    before_action :set_rental, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /rentals
    def index
      if @access_rights.can_view_campground?
        render json: @rentals
      else
        error_message = I18n.t 'errors.rights.rentals.view'
        render json: {error: error_message}, status: 401
      end
    end

    # GET /rentals/1
    def show
      if @access_rights.can_view_campground?
        render json: @rental
      else
        error_message = I18n.t 'errors.rights.rentals.view'
        render json: {error: error_message}, status: 401
      end
    end

    # POST /rentals
    def create
      if @access_rights.can_edit_campground?
        @rental = Rental.new(rental_params)

        if @rental.save
          render json: @rental, status: :created, location: @rental
        else
          render json: @rental.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.rentals.create'
        render json: {error: error_message}, status: 401
      end
    end

    # PATCH/PUT /rentals/1
    def update
      if @access_rights.can_edit_campground?
        if @rental.update(rental_params)
          render json: @rental
        else
          render json: @rental.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.rentals.edit'
        render json: {error: error_message}, status: 401
      end
    end

    # DELETE /rentals/1
    def destroy
      if @access_rights.can_edit_campground?
        @rental.destroy
      else
        error_message = I18n.t 'errors.rights.rentals.delete'
        render json: {error: error_message}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_rentals
      @rentals = Campground.find(params[:campground_id]).rentals
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def rental_params
      params.require(:rental).permit(:rental_category_id, :name)
    end
  end
end
