module Api::V1
  class ApiKeysController < ApiController
    before_action :set_api_keys, only: [:index]
    before_action :set_api_key, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /api_keys
    def index
      if @access_rights.can_view_api_keys?
        render json: @api_keys
      else
        error_message = I18n.t 'errors.rights.api_keys.view'
        render json: {error: error_message}, status: 401
      end
    end

    # GET /api_keys/1
    def show
      if @access_rights.can_view_api_keys?
        render json: @api_key
      else
        error_message = I18n.t 'errors.rights.api_keys.view'
        render json: {error: error_message}, status: 401
      end
    end

    # POST /api_keys
    def create
      if @access_rights.can_create_api_keys?
        @api_key = ApiKey.new(api_key_params)

        if @api_key.save
          render json: @api_key, status: :created, location: @api_key
        else
          render json: @api_key.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.api_keys.create'
        render json: {error: error_message}, status: 401
      end
    end

    # PATCH/PUT /api_keys/1
    def update
      if @access_rights.can_edit_api_keys?
        if @api_key.update(api_key_params)
          render json: @api_key
        else
          render json: @api_key.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.api_keys.edit'
        render json: {error: error_message}, status: 401
      end
    end

    # DELETE /api_keys/1
    def destroy
      if @access_rights.can_delete_api_keys?
        @api_key.destroy
      else
        error_message = I18n.t 'errors.rights.api_keys.delete'
        render json: {error: error_message}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_keys
      @api_keys = Campground.find(params[:campground_id]).api_keys
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_api_key
      @api_key = ApiKey.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_key_params
      params.require(:api_key).permit(:user_id, :campground_id, :token, :name, :can_view_bookings, :can_edit_bookings)
    end
  end
end
