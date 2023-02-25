import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hideable" ]

  show() {
    this.hideableTargets.forEach(el => {
      el.hidden = false
    });
  }

  hide() {
    this.hideableTargets.forEach(el => {
      el.hidden = true
    });
  }

  toggle() {
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    });
  }
}
