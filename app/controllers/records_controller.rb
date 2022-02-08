class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy, :edit]

  def index
    if params[:query].present?
      @records = policy_scope(Record).where(user: current_user).search_by_date(params[:query]).order(created_at: :desc)
    else
      @records = policy_scope(Record).where(user: current_user).order(created_at: :desc)
    end
  end

  def medical_histories
    if params[:query].present?
      @records = policy_scope(Record).where(user: current_user, history: true).search_by_date(params[:query])
    else
      @records = policy_scope(Record).where(user: current_user, history: true).order(created_at: :desc)
    end
    authorize @records
  end

  def patients_records
    if params[:query].present?
      @user = policy_scope(User).where(dni: params[:query])
      @records = policy_scope(Record).where(user_id: @user[0].id)
    else
      @records = policy_scope(Record).order(created_at: :desc)
    end
    authorize @records
  end

  def show
    init_medical_data
    authorize @record
    if params[:item] == "medical-image"
      @partial = "records/partials/medical_images"
    elsif params[:item] == "medical-result"
      @partial = "records/partials/medical_results"
    elsif params[:item] == "prescription"
      @partial = "records/partials/prescriptions"
    end
  end

  def new
    @record = Record.new
    authorize @record
  end

  def create
    @record = Record.new(record_params)
    authorize @record
    if @record.save
      redirect_to record_path(@record)
    else
      render :new
    end
  end

  def destroy
    authorize @record
    @record.destroy
    redirect_to records_path
  end

  def edit
    authorize @record
  end

  def update
    authorize @record

    if @record.update(record_params)
      redirect_to record_path(@record)
    else
      render :edit
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:appointment, :history, :user_id, :clinic_id)
  end

  def init_medical_data
    @medical_image = MedicalImage.new
    @medical_result = MedicalResult.new
    @prescription = Prescription.new
  end
end
