import { Controller } from "@hotwired/stimulus";

// This controller connects to data-controller="sign-in-form"
export default class extends Controller {
  connect() {
    const form = this.element;
    this.validateEmail(form);
    this.validatePassword(form);

    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      this.handlePasswordValidation();
      this.handleEmailValidation();
    }, false);
  }

  validateEmail(form) {
    form.addEventListener('input', event => {
      this.handleEmailValidation();
      this.handlePasswordValidation();
    });
  }

  validatePassword(form) {
    form.addEventListener('input', event => {
      this.handlePasswordValidation();
    });
  }

  handleEmailValidation() {
    let email = this.element.querySelector('[name="user[email]"]');
    // Email regexp https://www.w3resource.com/javascript/form/email-validation.php
    let emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

    if (!emailRegex.test(email.value)) {
      email.classList.add('is-invalid');
    } else {
      email.classList.remove('is-invalid');
      email.classList.add('is-valid');
    }
  }

  handlePasswordValidation() {
    let password = this.element.querySelector('[name="user[password]"]');
    // Basic password validation: at least 8 characters
    if (password.value.length < 1) {
      password.classList.add('is-invalid');
    } else {
      password.classList.remove('is-invalid');
      password.classList.add('is-valid');
    }
  }
}
