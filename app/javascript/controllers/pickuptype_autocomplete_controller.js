import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pickuptype-autocomplete"
export default class extends Controller {
  static targets = ["pickuptype"]
  connect() {
    this.pickuptypeTarget
  }
}
