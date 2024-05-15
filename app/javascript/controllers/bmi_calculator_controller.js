import { Controller } from "@hotwired/stimulus"

// Connects to data-controller='bmi-calculator'
export default class extends Controller {

  static targets = ['weight', 'height', 'bmi'];


  connect() {
    this.weightTarget.addEventListener('change', this.calculateBMI.bind(this));
    this.heightTarget.addEventListener('change', this.calculateBMI.bind(this));
  }

  calculateBMI() {
    const weight = this.weightTarget.value;
    let height = this.heightTarget.value;

    if (weight && height) {
      const bmi = (weight / (height * height)).toFixed(2);
      this.bmiTarget.value = bmi;
    }
  }
}
