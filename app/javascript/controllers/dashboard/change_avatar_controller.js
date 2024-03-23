import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard--change-avatar"
export default class extends Controller {
  static targets = ["form", "avatar", "newAvatar", "submit", "cancel"]

  showFiles(event) {
    event.preventDefault()
    event.stopPropagation()

    if (this.formTarget.classList.contains("d-none")) {
      this.formTarget.classList.remove("d-none")
    } else {
      this.resetForm(event)
    }
  }

  resetForm(event) {
    event.preventDefault()
    this.formTarget.reset()
    this.avatarTarget.classList.remove("d-none")
    this.formTarget.classList.add("d-none")
    this.newAvatarTarget.classList.add("d-none")
    this.submitTarget.parentElement.classList.add("d-none")
  }

  uploadImage(event) {
    var fileReader = new FileReader(),
      avatar = this.avatarTarget,
      newAvatar = this.newAvatarTarget

    fileReader.onload = function (file) {
      avatar.classList.add("d-none")
      newAvatar.classList.remove("d-none")
      newAvatar.style.backgroundImage = `url(${fileReader.result})`;
    };

    fileReader.readAsDataURL(event.currentTarget.files[0]);
    this.submitTarget.parentElement.classList.remove("d-none")
  }
}
