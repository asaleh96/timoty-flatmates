import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "link"]


    disable() {
      this.buttonTarget.innerText = "Request Sent!"
      this.buttonTarget.setAttribute("disabled", "")
      this.linkTarget.classList.remove("d-none")
    }
}
