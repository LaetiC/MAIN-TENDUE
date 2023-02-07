class RequestsController < ApplicationController
  before_action :set_request, only: %i[show destroy edit update]
  
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.item? == true
      @request.status = "confirmed"
    else
      @request.status = "pending"
    end
    @request.item = @item
    @request.user = current_user
    @request.save
    redirect_to request_path(@request)
  end

  def update
    set_request
    if @request.item? == true
      @request.status = "confirmed"
      @request.save
    end
    redirect_to dashboard_path
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
  
  def confirmation
  end

private

  def request_params
    params.require(:request).permit(:user_id, :status, :category, :needed_item, :item_id)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
