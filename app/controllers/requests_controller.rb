class RequestsController < ApplicationController
  before_action :set_request, only: %i[show destroy edit update]
  
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @request.destroy
    redirect_to dashboard_path, status: :see_other
  end

  def index
    @request = Request.all
  end

  def show
  end

  def confirmation
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end
end
