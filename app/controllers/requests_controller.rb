class RequestsController < ApplicationController
  before_action :set_request, only: %i[show destroy edit update]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    item_exist?
    @request.status = "pending"
    if item_exist? == true
      @request.item = @items_selected.first
      @request.status = "confirmed"
    end
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

  def item_exist?
    item_exist = false
    @items = Item.all
    @items_selected = []
    @items.each do |item| {
      if item.name == @request.needed_item && item.category == @request.category
        @items_selected.push(item)
      end
    }
    if @items_selected.empty? == false
      item_exist = true
    end
  end

private

  def request_params
    params.require(:request).permit(:category, :needed_item)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
