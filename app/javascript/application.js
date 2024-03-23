// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
// document.addEventListener('turbo:before-visit', (e) => {
//   if(window.location.href == e.detail.url){ e.preventDefault() }
// })

document.addEventListener('turbo:load', () => {
  setConfirmMethod()

  window.KTUtilElementDataStore = {};
  window.KTUtilElementDataStoreID = 0;
  window.KTUtilDelegatedEventHandlers = {};

  KTMenu.init();
  KTScroll.init();
  KTScrolltop.init();
  KTSwapper.init();
  KTSticky.init();
  KTDrawer.init();
  KTToggle.init();
  KTApp.init();
  KTLayoutExplore.init();
  KTLayoutHeader.init();
  KTLayoutSearch.init();

  document.querySelectorAll('[data-disable-with]').forEach((element) => {
    element.addEventListener('click', () => {
      const { disableWith } = element.dataset
      element.classList.add('disabled')
      element.innerText = disableWith
    })
  })
})

document.addEventListener("turbo:render", () => {
  setConfirmMethod()
})

function setConfirmMethod() {
  Turbo.setConfirmMethod(async (message) => {
    const result = await Swal.fire({
      html: message,
      icon: "info",
      buttonsStyling: false,
      showCancelButton: true,
      confirmButtonText: "Confirm",
      cancelButtonText: 'Cancel',
      customClass: {
          confirmButton: "btn btn-primary",
          cancelButton: 'btn btn-danger'
      }
    })

    return result.isConfirmed
  })
};
