module Api::V1
  class RightsController < ApiController
    before_action :set_right, only: [:show, :update, :destroy]

    # GET /rights
    def index
      @rights = Right.all

      render json: @rights
    end

    # GET /rights/1
    def show
      render json: @right
    end

    # POST /rights
    def create
      @right = Right.new(right_params)

      if @right.save
        render json: @right, status: :created, location: @right
      else
        render json: @right.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /rights/1
    def update
      if @right.update(right_params)
        render json: @right
      else
        render json: @right.errors, status: :unprocessable_entity
      end
    end

    # DELETE /rights/1
    def destroy
      @right.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_right
      @right = Right.find(params[:id])
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
