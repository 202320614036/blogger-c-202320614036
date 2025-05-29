controllers/admin/users_controller.rb

module Admin
  class UsersController < ApplicationController
    layout "admin"
    before_action :authenticate_user!
    before_action :authorize_admin
    before_action :set_user, only: %i[show edit update]

    def index
      @users = User.all
    end

    def show; end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to admin_user_path(@user)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def authorize_admin
      redirect_to root_path, alert: "Permissions denied" unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:email, :role)
    end

    def set_user
      @user = User.friendly.find(params[:id])
    end
  end
end