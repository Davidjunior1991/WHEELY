import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["startDate"];

  connect() {
    const unavailableDates = JSON.parse(this.startDateTarget.dataset.unavailable);

    flatpickr(this.startDateTarget, {
      dateFormat: "Y-m-d",
      disable: unavailableDates,
      minDate: "today",
    });
  }
}
