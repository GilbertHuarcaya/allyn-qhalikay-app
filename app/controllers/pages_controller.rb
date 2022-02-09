class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def create_doctor
    @users = User.all.where.not(admin: true).order(:dni)
    authorize @users
  end

  def update_doctor
    @user = User.find(params[:user])
    if @user.doctor == false
      @user.doctor = true
    else
      @user.doctor = false
    end
    @user.save!
    authorize @user
    redirect_to root_path
  end
end
