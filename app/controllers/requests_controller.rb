class RequestsController < ApplicationController
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::SanitizeHelper
  before_action :set_request, only: %i[show confirmation destroy edit edit_pickup update_pickup_ressourcerie update_pickup_maraude update_delivered]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @item = Item.where("name ILIKE ? AND category = ? AND status = ?", "%#{@request.needed_item}%", "#{@request.category}", "Objet disponible").first

    if @item.present?
      @item.update(status: "A la ressourcerie")
    else
      Message.create(content: "Avez-vous l'objet suivant : #{strip_tags(@request.needed_item)} ? #{link_to 'Oui', dashboard_path}", chatroom_id: "1", user: User.first)
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
  end

  def show
  end

  def edit_pickup
  end

  def update_pickup_ressourcerie
    @request.pickup_type = "Retrait ressourcerie"
    @request.save
    redirect_to dashboard_path, status: :see_other
    # @request.pickup_date
  end

  def update_pickup_maraude
    @request.pickup_type = "Dépôt maraude"
    @request.save
    redirect_to dashboard_path, status: :see_other
  end

  def update_delivered
    @request.status = "Remis"
    @request.save
  end

  def update

  end

  private

  def request_params
    params.require(:request).permit(:category, :needed_item)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
