class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @donor_requests = Request.where(status: "En recherche")
    @donor_pending_requests = Request.where(status: ["Besoin trouvé"])
    @donor_answered_requests = Request.where(status: ["A la ressourcerie", "Remis", "Annulée"])
    @closed_requests = current_user.requests.closed
    @pending_requests = current_user.requests.pending
  end
end
