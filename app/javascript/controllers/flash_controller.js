import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    this.element.computedStyleMap.animation = 'fade-in-and-out 4s'
    setTimeout(() => { this.element.remove() }, 4000) }
}
