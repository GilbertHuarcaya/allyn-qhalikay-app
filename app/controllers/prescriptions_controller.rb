class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
    authorize @prescription
  end

  def create
    @record = Record.find(params[:record_id])
    @prescription = Prescription.new(prescription_params)
    @prescription.record = @record
    authorize @prescription

    if @prescription.save
      redirect_to records_path
    else
      render :new
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])
    @record = Record.find(params[:record_id])
  end

  def update
    @prescription = Prescription.find(params[:id])
    @record = Record.find(params[:record_id])
    @prescription.update(prescription_params)

    if @prescription.update(prescription_params)
      redirect_to record_path(@record)
    else
      render :edit
    end


  end

  def show
  end

  private

  def prescription_params
     params.require(:prescription).permit(:title)
  end

end
