module Api::V1
  class RightsController < ApiController
    before_action :set_rights, only: [:index]
    before_action :set_right, only: [:show, :update]
    before_action :set_access_rights, only: [:index, :show, :update]

    # GET /rights
    def index
      if @access_rights.can_view_rights?
        render json: @rights
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # GET /rights/1
    def show
      if @access_rights.can_view_rights?
        render json: @right
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # PATCH/PUT /rights/1
    def update
      if @access_rights.can_edit_rights?
        if @right.update(right_params)
          render json: @right
        else
          render json: @right.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_rights
      @rights = Campground.find(params[:campground_id]).rights
    end

    def set_right
      @right = Right.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def right_params
      params.require(:right).permit(:user_id,
                                    :campground_id,
                                    :can_view_rights,
                                    :can_edit_rights,
                                    :can_view_campground,
                                    :can_edit_campground,
                                    :can_view_bookings,
                                    :can_edit_bookings,
                                    :can_create_bookings,
                                    :can_delete_bookings,
                                    :can_view_clients,
                                    :can_edit_clients,
                                    :can_delete_clients,
                                    :can_view_api_keys,
                                    :can_create_api_keys,
                                    :can_edit_api_keys,
                                    :can_delete_api_keys,
                                    :can_view_users,
                                    :can_create_users,
                                    :can_edit_users,
                                    :can_delete_users)
    end
  end
end
