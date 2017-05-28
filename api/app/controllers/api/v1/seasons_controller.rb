module Api::V1
  class SeasonsController < ApiController
    before_action :set_seasons, only: [:index]
    before_action :set_season, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /seasons
    def index
      if @access_rights.can_view_campground?
        render json: @seasons
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # GET /seasons/1
    def show
      if @access_rights.can_view_campground?
        render json: @season
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # POST /seasons
    def create
      if @access_rights.can_edit_campground?
        @season = Season.new(season_params)

        if @season.save
          render json: @season, status: :created, location: @season
        else
          render json: @season.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # PATCH/PUT /seasons/1
    def update
      if @access_rights.can_edit_campground?
        if @season.update(season_params)
          render json: @season
        else
          render json: @season.errors, status: :unprocessable_entity
        end
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    # DELETE /seasons/1
    def destroy
      if @access_rights.can_edit_campground?
        @season.destroy
      else
        render json: {error: "You don't have access to this page"}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_seasons
      @seasons = Campground.find(params[:campground_id]).seasons
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def season_params
      params.require(:season).permit(:campground_id, :name, :start_date, :end_date)
    end
  end
end
