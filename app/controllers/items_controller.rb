class ItemsController < ApplicationController
  before_action :set_item, only: %i[update edit destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path()
    else
      render :new, status: :unprocessable_entity
    end
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
