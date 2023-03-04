class ItemsController < ApplicationController
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::SanitizeHelper
  before_action :set_item, only: %i[update edit destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if requests_selected.any?
      requests_selected.first.item = @item
      @request.item.status = "Attribué"
      @request.status = "A la Ressourcerie"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    set_item
    if requests_selected.any?
      requests_selected.first.item = @item
      @item.status = "Attribué"
      @request.status = "A la Ressourcerie"
      @item.save
      @request.save
    end
    redirect_to item_index_path(@item)
  end

  def update_nested_item # item_delivered_at_ressourcerie
    @request = Request.find(params[:request_id])
    @item = @request.item
    @item.status = "Attribué"
    @request.status = "A la ressourcerie"
    @item.save
    @request.save
    Message.create(content: "Bonne nouvelle!! Nous avons l'objet que vous cherchiez: #{strip_tags(@request.needed_item.capitalize)}. #{link_to 'Choisir mon option de retrait', edit_pickup_path(@request), class: "btn mt-3 ms-1"}", chatroom_id: "2", user: User.first)
    redirect_to dashboard_path(display_donation: true), status: :see_other
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

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :photo)
  end

  def requests_selected
    requests_selected = []
    requests = Request.all
    requests.each do |request|
      if request.needed_item == @item.name && request.category == @item.category && request.status == "En recherche"
        requests_selected.push(request)
      end
    end
    requests_selected
  end
end
