import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.showSweetAlert();
  }

  showSweetAlert() {
    if (this.element.innerHTML.trim() !== '') {
      this.element.innerHTML = '';
    }
  }
}
