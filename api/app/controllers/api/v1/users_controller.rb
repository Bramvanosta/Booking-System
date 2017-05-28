module Api::V1
  class UsersController < ApplicationController
    before_action :set_users, only: [:index]
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :set_access_rights, only: [:index, :show, :create, :update, :destroy]

    # GET /users
    def index
      if @access_rights.can_view_users?
        render json: @users
      else
        error_message = I18n.t 'errors.rights.users.view'
        render json: {error: error_message}, status: 401
      end
    end

    # GET /users/1
    def show
      if @access_rights.can_view_users?
        render json: @user
      else
        error_message = I18n.t 'errors.rights.users.view'
        render json: {error: error_message}, status: 401
      end
    end

    # POST /users
    def create
      if @access_rights.can_create_users?
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.users.create'
        render json: {error: error_message}, status: 401
      end
    end

    # PATCH/PUT /users/1
    def update
      if @access_rights.can_edit_users?
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      else
        error_message = I18n.t 'errors.rights.users.edit'
        render json: {error: error_message}, status: 401
      end
    end

    # DELETE /users/1
    def destroy
      if @access_rights.can_delete_users?
        @user.destroy
      else
        error_message = I18n.t 'errors.rights.users.delete'
        render json: {error: error_message}, status: 401
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @users = Campground.find(params[:campground_id]).users
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_access_rights
      # @access_rights = current_v1_user.rights.where(campground_id: params[:campground_id])
      @access_rights = User.find(1).rights.find_by(campground_id: params[:campground_id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
end
