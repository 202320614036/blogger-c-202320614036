class ProfilesController < ApplicationController
  before_action :set_user
  before_action :authorize_user!, only: [:new, :create, :edit, :update]
  before_action :redirect_if_profile_exists, only: [:new, :create]
  before_action :set_profile, only: [:edit, :update, :show]

  def show
  end

  def new
    @profile = @user.build_profile
  end

  def edit
  end

  def create
    @profile = @user.build_profile(profile_params)

    if @profile.save
      redirect_to user_profile_path(@user), notice: "Profil başarılı bir şekilde oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_profile_path(@user), notice: "Profil başarılı bir şekilde güncellendi."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def set_profile
    @profile = @user.profile
  end

  def profile_params
    params.require(:profile).permit(:bio, :image, :github, :twitter, :linkedin)
  end

  def authorize_user!
    unless current_user == @user
      redirect_to root_path, alert: "You're not allowed to access this profile."
    end
  end

  def redirect_if_profile_exists
    if current_user.profile.present?
      redirect_to user_profile_path(current_user), alert: "Zaten profil oluşturulmuş."
    end
  end
end
