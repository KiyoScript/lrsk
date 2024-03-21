import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sign-up-form"
export default class extends Controller {
  connect() {
    const form = this.element

    this.validatePassword(form)
    this.validateEmail(form)

    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      this.handlePasswordValidation()
      this.handleEmailValidation()
    }, false)
  }

  validateEmail(form) {
    form.addEventListener('input', event => {
      this.handleEmailValidation()
      this.handlePasswordValidation()
    })
  }

  validatePassword(form) {
    form.addEventListener('input', event => {
      this.handlePasswordValidation()
    })
  }

  handleEmailValidation() {
    let email = this.element.querySelector('[name="user[email]"]')
    // Email regexp https://www.w3resource.com/javascript/form/email-validation.php
    let emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/

    if (!emailRegex.test(email.value)) {
      email.classList.add('is-invalid')
    } else {
      email.classList.remove('is-invalid')
      email.classList.add('is-valid')
    }
  }

  handlePasswordValidation() {
    let password = this.element.querySelector('[name="user[password]"]')
    let password_confirmation = this.element.querySelector('[name="user[password_confirmation]"]')

    if (password.value.length <= 5) {
      password.classList.add('is-invalid')
      password_confirmation.classList.add('is-invalid')
    } else {
      password.classList.remove('is-invalid')
      password.classList.add('is-valid')
      password_confirmation.classList.remove('is-invalid')
      password_confirmation.classList.add('is-valid')

      if (password.value != password_confirmation.value) {
        password_confirmation.classList.add('is-invalid')
        password.classList.remove('is-valid')
        password_confirmation.classList.remove('is-valid')
      } else {
        password.classList.remove('is-invalid')
        password.classList.add('is-valid')
        password_confirmation.classList.remove('is-invalid')
        password_confirmation.classList.add('is-valid')
      }
    }
  }
}
