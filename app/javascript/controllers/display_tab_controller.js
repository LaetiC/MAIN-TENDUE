import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-tab"
export default class extends Controller {
  static targets = [ "donationTab" ]
  static values = {
    displayDonationTab: { type: Boolean, default: false }
  }
  connect() {
    if (this.displayDonationTabValue) this.donationTabTarget.click()
  }
}
