import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radio", "textarea"];

  connect() {
    this.toggleTextarea();
  }

  toggleTextarea() {
    const isChecked = this.radioTargets.find(radio => radio.checked && radio.value === 'no');
    this.textareaTarget.disabled = !isChecked;
  }
}
