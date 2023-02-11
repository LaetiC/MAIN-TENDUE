class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @donor_requests = Request.all
    @requester_requests = current_user.requests
    @closed_requests = current_user.requests.closed
    @pending_requests = current_user.requests.pending
  end
end
