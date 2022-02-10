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
    @role = params[:role].capitalize || "Médico"
    if @user.doctor == false
      @user.doctor = true
      @user.user_name = "#{@role} #{@user.user_name}"
    else
      @user.doctor = false
      @user.user_name = @user.user_name.split(" ").drop(1).join(" ")
    end
    @user.save!
    authorize @user
    redirect_to root_path
  end
end
