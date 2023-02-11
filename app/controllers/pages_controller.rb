class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @donor_requests = Request.where(status: "En recherche")
    @requester_answered_requests = Request.where(status: "Besoin Trouvé") #à modifier quand lien entre Request et Item sera fait
    @closed_requests = current_user.requests.closed
    @pending_requests = current_user.requests.pending
  end
end
