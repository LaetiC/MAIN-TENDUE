class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @donor_requests = Request.where(status: "En recherche")
    @requester_answered_requests = current_user.requests
    @closed_requests = current_user.requests.closed
    @pending_requests = Request.where(status:"pending", user: current_user) #current_user.requests.pending
  end
end
