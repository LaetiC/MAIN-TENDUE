import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ 'pickup_date' ]
  connect() {
    console.log(this.pickup_dateTarget)
    flatpickr(this.pickup_dateTarget, {
        mode: "multiple",
        dateFormat: "d-m-Y",
        inline: true
    });
  }
}
