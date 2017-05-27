module Api::V1
  class BookingsController < ApiController
    before_action :set_bookings, only: [:index]
    before_action :set_booking, only: [:show, :update, :destroy]
    before_action :set_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /bookings
    def index
      if @rights.can_view_bookings?
        render json: @bookings
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # GET /bookings/1
    def show
      if @rights.can_view_bookings?
        render json: @booking
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # POST /bookings
    def create
      if @rights.can_create_bookings?
        @booking = Booking.new(booking_params)

        if @booking.save
          render json: @booking, status: :created, location: @booking
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # PATCH/PUT /bookings/1
    def update
      if @rights.can_edit_bookings?
        if @booking.update(booking_params)
          render json: @booking
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # DELETE /bookings/1
    def destroy
      if @rights.can_delete_bookings?
        @booking.destroy
      else
        render json: {error: "You don't have access to this page"}, status: 401
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
    def set_rights
      # @rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:campground_id, :client_id, :status, :arrival_date, :departure_date)
    end
  end
end
