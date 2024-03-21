import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['flashMessage'];

  connect() {
    this.removeFlashMessage();
  }
  removeFlashMessage() {
    if (this.flashMessageTarget) {
      setTimeout(() => {
        this.flashMessageTarget.classList.add("fade");
        setTimeout(() => {
          this.flashMessageTarget.remove();
        }, 500);
      }, 2000);
    }
  }
}
