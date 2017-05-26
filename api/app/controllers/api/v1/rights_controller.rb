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
      params.require(:right).permit(:user_id, :campground_id, :can_view_bookings, :can_edit_bookings)
    end
  end
end
