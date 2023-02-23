import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pickuptype-autocomplete"
export default class extends Controller {
  static targets = ["pickuptype", "maraude", "ressourcerie"]
  connect() {
    console.log("coucou")
    console.log(this.pickuptypeTarget)
  }
  maraude(event) {
    this.pickuptypeTarget.value = "Dépôt Maraude"
    // event.currentTarget.classList.toggle("selected")
    this.maraudeTarget.classList.toggle("selected")
    if (this.ressourcerieTarget.classList.contains("selected")) {
      this.ressourcerieTarget.classList.toggle("selected")
    }
  }
  ressourcerie (event) {
    this.pickuptypeTarget.value = "Retrait Ressourcerie"
    // event.currentTarget.classList.toggle("selected")
    this.ressourcerieTarget.classList.toggle("selected")
    if (this.maraudeTarget.classList.contains("selected")) {
      this.maraudeTarget.classList.toggle("selected")
    }
  }
}
