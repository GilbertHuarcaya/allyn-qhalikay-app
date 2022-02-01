class ClinicsController < ApplicationController
  def index
    if params[:query].present?
      @clinics = Clinic.search_by_address_and_name(params[:query])
    else
      @clinics = Clinic.all
    end
    set_markers
  end

  def show
  end

  private

  def set_markers
    @markers = @clinics.geocoded.map do |clinic|
      {
        lat: clinic.latitude,
        lng: clinic.longitude,
        info_window: render_to_string(partial: "info_window", locals: { clinic: clinic }),
        image_url: helpers.asset_url("https://www.svgrepo.com/show/76803/hospital.svg"),
      }
    end
  end
end
