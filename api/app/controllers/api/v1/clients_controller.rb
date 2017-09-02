module Api::V1
  class ClientsController < ApiController
    before_action :set_clients, only: [:index]
    before_action :set_client, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :update, :destroy]

    # GET /clients
    def index
      if @access_rights.can_view_clients?
        render json: @clients
      else
        error_message = I18n.t 'errors.rights.clients.view'
        render json: {error: error_message}, status: 401
      end
    end

    # GET /clients/1
    def show
      if @access_rights.can_view_clients?
        render json: @client
      else
        error_message = I18n.t 'errors.rights.clients.view'
        render json: {error: error_message}, status: 401
      end
    end

    # PATCH/PUT /clients/1
    def update
      if @access_rights.can_edit_clients?
        if @client.update(client_params)
          render json: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.clients.edit'
        render json: {error: error_message}, status: 401
      end
    end

    # DELETE /clients/1
    def destroy
      if @access_rights.can_delete_clients?
        @client.destroy
      else
        error_message = I18n.t 'errors.rights.clients.delete'
        render json: {error: error_message}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_clients
      @clients = Campground.find(params[:campground_id]).clients
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      @access_rights = current_v1_user.rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:title, :first_name, :last_name, :email, :address, :zip_code, :city, :country, :phone_number, :mobile_number)
    end
  end
end
