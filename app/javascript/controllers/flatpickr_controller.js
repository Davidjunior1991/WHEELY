import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";


export default class extends Controller {
  static values = {
    unavailable: Array
  }


  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      disable: this.unavailableValue,
      minDate: "today",
    });
  }
}
