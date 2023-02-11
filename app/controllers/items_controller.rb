class ItemsController < ApplicationController
  before_action :set_item, only: %i[update edit destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.request?
      @item.request.status = "found"
      @item.save
      end
    else 

      redirect_to items_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    set_request
    @request.update(status: "found") if item_found?
    redirect_to dashboard_path
  end

  def request_found?
    requests = Requests.all
    requests_found = requests.select do |request|
      request.needed_item == @item.name && request.category == @item.category && request.status == "pending"
    end
    requests_found.any?
  end

  def requests_selected
    requests_selected = []
    requests = Request.all
    requests.each do |request|
      if request.needed_item == @item.name && request.category == @item.category && request.status == "pending"
        requests_selected.push(request)
      end
    end
    requests_selected
  end

  def update
    @item.update(item_params)
    redirect_to item_index_path(@item)
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to item_index_path(@item), status: :see_other
  end

  def index
    @items = Item.all
  end

  # def show
  # end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :photo)
  end
end
