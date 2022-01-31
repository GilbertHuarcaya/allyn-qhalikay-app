class RecordsController < ApplicationController

  def index
    @records = Record.where(params[:user_id])
  end

  def show
  end
end
