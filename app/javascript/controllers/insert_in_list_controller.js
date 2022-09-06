import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  //static event = "connect"
  static targets = ["items"]
  connect() {
    console.log("coucou");
    this.interval = setInterval(this.refreshRender, 5000);
  }

  update_user() {
    fetch("/connect", { headers: {accept: "application/json"}})
    .then(response => response.json())
    .then((data) => {
      this.itemsTarget.innerHTML = data.html;
    })
  }

  refreshRender = () => {

    fetch( window.location.href, { headers: {"Accept": "application/json"} })
      .then(response => response.json())
      .then((data) => {
        console.log(load)
      }
    )

  }
  disconnect() {
    clearInterval(this.interval)
  }
}
