class MedicalResultsController < ApplicationController
  before_action :set_medical_result, only: [:show, :update, :destroy, :edit]

  def new
    @medical_result = MedicalResult.new
    authorize @medical_result
  end

  def create
    @medical_result = MedicalResult.new(medical_result_params)
    @record = Record.find(params[:record_id])
    @medical_result.record = @record
    authorize @medical_result
    @medical_result.save
    redirect_to record_path(@record)

  end

  def destroy
    authorize @medical_result
    @medical_result.destroy
    redirect_to medical_results_path
  end

  def edit
    authorize @medical_result
  end

  def update
    authorize @medical_result
    @medical_result.update(medical_result_params)
    redirect_to medical_result_path(@medical_result)
  end

  private

  def set_medical_result
    @medical_result = MedicalResult.find(params[:id])
  end

  def medical_result_params
    params.require(:medical_result).permit(:title, :photo)
  end
end
