module Api::V1
  class PaymentsController < ApiController
    before_action :set_payments, only: [:index]
    before_action :set_payment, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /payments
    def index
      if @access_rights.can_view_bookings?
        render json: @payments
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # GET /payments/1
    def show
      if @access_rights.can_view_bookings?
        render json: @payment
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # POST /payments
    def create
      if @access_rights.can_create_bookings?
        @payment = Payment.new(payment_params)

        if @payment.save
          render json: @payment, status: :created, location: @payment
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # PATCH/PUT /payments/1
    def update
      if @access_rights.can_edit_bookings?
        if @payment.update(payment_params)
          render json: @payment
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # DELETE /payments/1
    def destroy
      if @access_rights.can_delete_bookings?
        @payment.destroy
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_payments
      @payments = Campground.find(params[:campground_id]).payments
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:booking_id, :price_cents, :price_currency, :method)
    end
  end
end
