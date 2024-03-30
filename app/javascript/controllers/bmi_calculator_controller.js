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

    height = height * 0.0254; // 1 inch is equal to 0.0254 meters

    if (weight && height) {
      const bmi = (weight / (height * height)).toFixed(1);
      this.bmiTarget.value = bmi;
    }
  }
}
