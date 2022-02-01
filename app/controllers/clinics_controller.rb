class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.all
    @markers = @clinics.geocoded.map do |clinic|
      {
        lat: clinic.latitude,
        lng: clinic.longitude,
        info_window: render_to_string(partial: "info_window", locals: { clinic: clinic }),
        image_url: helpers.asset_url("https://www.svgrepo.com/show/76803/hospital.svg"),
      }
    end
  end

  def show
  end
end
