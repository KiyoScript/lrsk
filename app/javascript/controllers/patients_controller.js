import { Controller } from "@hotwired/stimulus"

// Connects to data-controller='patients'
export default class extends Controller {
  static targets = ['birthdate', 'age']

  connect() {
    this.birthdateTarget.addEventListener('change', this.calculateAge.bind(this))
  }

  calculateAge() {
    let birthdate = new Date(this.birthdateTarget.value)
    let now = new Date()
    let age = now.getFullYear() - birthdate.getFullYear()
    if (now.getMonth() < birthdate.getMonth() || (now.getMonth() == birthdate.getMonth() && now.getDate() < birthdate.getDate())) {
      age--
    }
    this.ageTarget.value = age
  }
}
