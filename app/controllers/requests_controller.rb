class RequestsController < ApplicationController
  before_action :set_request, only: %i[show destroy edit update]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @items_selected = items_selected
    @request.status = "En recherche" #a mettre dans le model
    if @items_selected.any? && @item.status == "object disponible"
      @request.item = @items_selected.first
      @request.status = "A la Ressourcerie"
      @request.save
    end
    @request.user = current_user
    @request.save
    redirect_to request_path(@request)
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
    params.require(:request).permit(:category, :needed_item)
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def items_selected
    items_selected = []
    items = Item.all
    items.each do |item|
      if item.name == @request.needed_item && item.category == @request.category && item.status == "object disponible"
        items_selected.push(item)
        item.status = "object attribué"
        item.save
      end
    end
    items_selected
  end
end
