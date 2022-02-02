class RecordsController < ApplicationController

  def index
    @records = Record.where(user: current_user)
     #@medicalresult = MedicalResult.find(params[:medicalresult_id])
    # @medicalimage = MedicalImage.find(params [:medicalimage_id])
    # @prescription = Prescription.find(params[:prescription_id])

  end

  def show
    @record = Record.find(params[:id])

  end

  def new

  end
end
