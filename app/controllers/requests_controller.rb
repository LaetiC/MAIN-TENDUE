class RequestsController < ApplicationController
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::SanitizeHelper
  before_action :set_request, only: %i[show update confirmation dropoff destroy edit edit_pickup update_pickup update_delivered]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @item = Item.where("name ILIKE ? AND category = ? AND status = ?", "%#{@request.needed_item}%", "#{@request.category}", "Objet disponible").first

    if @item.present?
      @item.update(status: "A la ressourcerie")
    else
      Message.create(content: "Nouvelle demande d'objet : #{strip_tags(@request.needed_item)} . #{link_to 'Voir détails de la demande', dashboard_path}", chatroom_id: "1", user: User.first)
    end

    @request.user = current_user
    @request.save
    redirect_to request_path(@request)
  end

  def edit
  end

  def cancel
    @request.status = "Annulée"
    redirect_to dashboard_path, status: :see_other
  end

  def index
    @request = Request.all
  end

  def confirmation
    if @request.pickup_type == "Dépôt Maraude"
      @address = "67 Rue Myrha, 75018 Paris"
      @markers = [{lat: 48.886600, lng: 2.350450 }]
    elsif @request.pickup_type == "Retrait Ressourcerie"
      @address = "4 Bis Rue d'Oran, 75018 Paris, France"
      @markers = [{lat: 48.8890471, lng: 2.3540006 }]
    end
  end

  def dropoff
  end

  def show
  end

  def edit_pickup
  end

  def update
    if @request.update(update_params)
      if params[:request][:create_nested_item]
        create_nested_item
      else
        redirect_to request_confirmation_path
      end
    else
      render :edit_pickup
    end
  end

  def update_delivered
    @request.status = "Remis"
    @request.save
    redirect_to dashboard_path, status: :see_other
  end


  private

  def request_params
    params.require(:request).permit(:category, :needed_item, :description)
  end

  def update_params
    params.require(:request).permit(:pickup_type, :pickup_date, :dropoff_date)
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def create_nested_item
    @item = Item.new(name: @request.needed_item, category: @request.category)
    @request.item = @item
    @request.status = "Besoin trouvé"
    @item.user = current_user
    @request.save
    @item.save
    redirect_to dashboard_path(display_donation: true), status: :see_other
  end
end
