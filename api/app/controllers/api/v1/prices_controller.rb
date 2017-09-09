module Api::V1
  class PricesController < ApiController
    before_action :set_prices, only: [:index]
    before_action :set_price, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /prices
    def index
      if @access_rights.can_view_campground?
        render json: @prices
      else
        error_message = I18n.t 'errors.rights.prices.view'
        render json: {error: error_message}, status: 401
      end
    end

    # GET /prices/1
    def show
      if @access_rights.can_view_campground?
        render json: @price
      else
        error_message = I18n.t 'errors.rights.prices.view'
        render json: {error: error_message}, status: 401
      end
    end

    # POST /prices
    def create
      if @access_rights.can_edit_campground?
        @price = Price.new(price_params)

        if @price.save
          render json: @price, status: :created, location: @price
        else
          render json: @price.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.prices.create'
        render json: {error: error_message}, status: 401
      end
    end

    # PATCH/PUT /prices/1
    def update
      if @access_rights.can_edit_campground?
        if @price.update(price_params)
          render json: @price
        else
          render json: @price.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.prices.edit'
        render json: {error: error_message}, status: 401
      end
    end

    # DELETE /prices/1
    def destroy
      if @access_rights.can_edit_campground?
        @price.destroy
      else
        error_message = I18n.t 'errors.rights.prices.delete'
        render json: {error: error_message}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_prices
      @prices = Campground.find(params[:campground_id]).seasons.find(params[:season_id]).prices.where(rental_category_id: params[:rental_category_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      @access_rights = current_v1_user.rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def price_params
      params.require(:price).permit(:season_id, :rental_category_id, :name, :price_cents, :price_currency)
    end
  end
end
