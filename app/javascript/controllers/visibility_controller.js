import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hideable" ]

  show() {
    this.hideableTargets.forEach(el => {
      el.hidden = false
    });
  }

  hide(event) {
    event.currentTarget.closest(".list-group-item").hidden = true
    };

  toggle() {
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    });
  }
}
