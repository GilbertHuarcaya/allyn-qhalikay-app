class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :update, :destroy, :edit]

  def index
    if params[:query].present?
      @clinics = policy_scope(Clinic).search_by_address_and_name(params[:query]).order(created_at: :desc)
    else
      @clinics = policy_scope(Clinic).order(created_at: :desc)
    end
    set_markers
  end

  def show
    authorize @clinic
    @marker = [
      { lat: @clinic.latitude,
        lng: @clinic.longitude,
        info_window: render_to_string(partial: "info_window", locals: { clinic: @clinic }),
        image_url: helpers.asset_url("https://toppng.com/public/uploads/thumbnail/health-plan-icon-hospital-icon-blue-11553476430bezplz521n.png") },
      { lat: current_user.latitude,
        lng: current_user.longitude,
        info_window: render_to_string(partial: "info_window_user", locals: { user: current_user }),
        image_url: helpers.asset_url("https://cdn-icons-png.flaticon.com/512/3307/3307713.png") },
    ]
  end

  def new
    @clinic = Clinic.new
    authorize @clinic
  end

  def create
    @clinic = Clinic.new(clinic_params)
    authorize @clinic
    if @clinic.save
      redirect_to clinic_path(@clinic)
    else
      render :new
    end
  end

  def destroy
    authorize @clinic
    @clinic.destroy
    redirect_to clinics_path
  end

  def edit
    authorize @clinic
  end

  def update
    authorize @clinic
    @clinic.update(clinic_params)
    redirect_to clinic_path(@clinic)
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:description, :name, :address, :phone, :photo, photos: [])
  end

  def set_markers
    @markers = @clinics.geocoded.map do |clinic|
      {
        lat: clinic.latitude,
        lng: clinic.longitude,
        info_window: render_to_string(partial: "info_window", locals: { clinic: clinic }),
        image_url: helpers.asset_url("https://toppng.com/public/uploads/thumbnail/health-plan-icon-hospital-icon-blue-11553476430bezplz521n.png"),
      }
    end
  end
end
