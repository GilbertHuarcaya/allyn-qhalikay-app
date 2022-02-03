class MedicalImagesController < ApplicationController
  before_action :set_medical_image, only: [:show, :update, :destroy, :edit]

  def new
    @medical_image = MedicalImage.new
    authorize @medical_image
  end

  def create
    @medical_image = MedicalImage.new(medical_image_params)
    @record = Record.find(params[:record_id])
    @medical_image.record = @record
    authorize @medical_image
    if @medical_image.save
      redirect_to record_path(@record)
    else
      render :new
    end
  end

  def destroy
    authorize @medical_image
    @medical_image.destroy
    redirect_to medical_images_path
  end

  def edit
    authorize @medical_image
  end

  def update
    authorize @medical_image
    @medical_image.update(medical_image_params)
    redirect_to medical_image_path(@medical_image)
  end

  private

  def set_medical_image
    @medical_image = MedicalImage.find(params[:id])
  end

  def medical_image_params
    params.require(:medical_image).permit(:title, :photo)
  end
end
