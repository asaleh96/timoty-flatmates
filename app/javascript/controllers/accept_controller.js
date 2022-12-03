import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["button", 'form']

  connect() {
    console.log('connected');
  }


    disable() {
      console.log('disable btn working')
      this.buttonTarget.innerText = "Request Sent!"
     // this.buttonTarget.setAttribute("disabled", "")
    }

    submit(event){
    event.preventDefault()
    this.buttonTarget.submit()
    this.disable();
  }


}
