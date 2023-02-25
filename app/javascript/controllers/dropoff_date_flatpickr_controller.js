import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


export default class extends Controller {
  static targets = ['dropoff_date']
  connect() {
    console.log("yo!")
    flatpickr(this.dropoff_dateTarget, {
      inline: true,
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
}
