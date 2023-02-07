class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @requester_requests = current_user.requests
    @donor_requests = Request.all
    @answered_requests = current_user.answered_requests
    @canceled_requests = current_user.requests.canceled
    @confirmed_requests = current_user.requests.confirmed
    @pending_requests = current_user.requests.pending
  end
end
