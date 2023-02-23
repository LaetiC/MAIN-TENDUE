import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ 'pickup_date', 'pickup_type' ]

  connect() {
    console.log("salut")
    this.element.addEventListener('pickuptype-autocomplete:added', this.update)
  }

  update() {
    console.log("update")
    if (this.pickup_typeTarget.value === "Retrait Ressourcerie") {
      flatpickr(this.pickup_dateTarget, {
          altInput: true,
          altFormat: "F j, Y",
          dateFormat: "Y-m-d",
          minDate: "today",
          maxDate: new Date().fp_incr(8),
          "disable": [
            function(date) {
              // return true to disable
              return (date.getDay() === 0 || date.getDay() === 6);
            }
          ],
          "locale": {
            "firstDayOfWeek": 1 // start week on Monday
          },
      });
    } else if (this.pickup_typeTarget.value === "Dépôt Maraude") {
      console.log(this.pickup_dateTarget.value)
      flatpickr(this.pickup_dateTarget, {
          altInput: true,
          altFormat: "F j, Y",
          dateFormat: "Y-m-d",
          minDate: "today",
          maxDate: new Date().fp_incr(8),
          "enable": [
            function(date) {
              // return true to disable
              return (date.getDay() === 2 || date.getDay() === 4);
            }
          ],
          "locale": {
            "firstDayOfWeek": 1 // start week on Monday
          },
      });
    }
  }
}
