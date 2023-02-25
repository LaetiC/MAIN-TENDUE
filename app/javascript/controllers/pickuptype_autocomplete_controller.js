import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="pickuptype-autocomplete"
export default class extends Controller {
  static targets = ["pickuptype", "maraude", "ressourcerie", "pickup_date"]

  connect() {
    this.ressourcerie()
  }

  maraude(event) {
    this.pickuptypeTarget.value = "Dépôt Maraude"
    this.maraudeTarget.classList.add("selected")
    this.ressourcerieTarget.classList.remove("selected")
    this.updateMaraude()
  }

  ressourcerie(event) {
    this.pickuptypeTarget.value = "Retrait Ressourcerie"
    this.ressourcerieTarget.classList.add("selected")
    this.maraudeTarget.classList.remove("selected")
    this.updateRessourcerie()
  }

  updateRessourcerie() {
    flatpickr(this.pickup_dateTarget, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      maxDate: new Date().fp_incr(8),
      "disable": [
        function (date) {
          // return true to disable
          return (date.getDay() === 0 || date.getDay() === 6);
        }
      ],
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
      },
    });
  }

  updateMaraude() {
    flatpickr(this.pickup_dateTarget, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      maxDate: new Date().fp_incr(8),
      "enable": [
        function (date) {
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
