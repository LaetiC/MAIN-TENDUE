import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ 'pickup_date' ]
  connect() {
    console.log(this.pickup_dateTarget)
    flatpickr(this.pickup_dateTarget, {
        enableTime: true,
        time_24hr: true,
        minTime: "11:00",
        maxTime: "20:00",
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d H:i",
        minDate: "today",
        maxDate: new Date().fp_incr(7),
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
  //   flatpickr(this.maraude_dateTarget, {
  //     altInput: true,
  //     altFormat: "F j, Y",
  //     dateFormat: "Y-m-d",
  //     inline: true,
  //     minDate: "today",
  //     maxDate: new Date().fp_incr(7),
  //     "disable": [
  //       function(date) {
  //         // return true to disable
  //         return (date.getDay() === 0 || date.getDay() === 6);
  //       }
  //     ],
  //     "locale": {
  //       "firstDayOfWeek": 1 // start week on Monday
  //     }
  // });
  }
}
