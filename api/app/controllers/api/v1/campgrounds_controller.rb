module Api::V1
  class CampgroundsController < ApiController
    before_action :set_campgrounds, only: [:index]
    before_action :set_campground, only: [:show, :update]
    before_action :set_access_rights, only: [:show, :update]

    # GET /campgrounds
    def index
      render json: @campgrounds
    end

    # GET /campgrounds/1
    def show
      if @access_rights.can_view_campground?
        render json: @campground
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # PATCH/PUT /campgrounds/1
    def update
      if @access_rights.can_edit_campground?
        if @campground.update(campground_params)
          render json: @campground
        else
          render json: @campground.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_campgrounds
      # @campgrounds = current_v1_user.campgrounds
      @campgrounds = User.find(1).campgrounds
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_campground
      @campground = Campground.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campground_params
      params.require(:campground).permit(:name, :address, :zip_code, :city, :country, :longitude, :latitude, :logo_url, :website_url, :phone_number, :mobile_number, :currency)
    end
  end
end
