module Api::V1
  class BookingsController < ApiController
    before_action :set_bookings, only: [:index]
    before_action :set_booking, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /bookings
    def index
      if @access_rights.can_view_bookings?
        render json: @bookings
      else
        error_message = I18n.t 'errors.rights.bookings.view'
        render json: {error: error_message}, status: 401
      end
    end

    # GET /bookings/1
    def show
      if @access_rights.can_view_bookings?
        render json: @booking
      else
        error_message = I18n.t 'errors.rights.bookings.view'
        render json: {error: error_message}, status: 401
      end
    end

    # POST /bookings
    def create
      if @access_rights.can_create_bookings?
        @booking = Booking.new(booking_params)

        if @booking.save
          render json: @booking, status: :created, location: @booking
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.bookings.create'
        render json: {error: error_message}, status: 401
      end
    end

    # PATCH/PUT /bookings/1
    def update
      if @access_rights.can_edit_bookings?
        if @booking.update(booking_params)
          render json: @booking
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.bookings.edit'
        render json: {error: error_message}, status: 401
      end
    end

    # DELETE /bookings/1
    def destroy
      if @access_rights.can_delete_bookings?
        @booking.destroy
      else
        error_message = I18n.t 'errors.rights.bookings.delete'
        render json: {error: error_message}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookings
      @bookings = Campground.find(params[:campground_id]).bookings
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      @access_rights = current_v1_user.rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:campground_id, :client_id, :status, :arrival_date, :departure_date)
    end
  end
end
