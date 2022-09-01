import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { deckId: Number }
  static targets = ["round", "rounds"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "DeckChannel", id: this.deckIdValue },
      { received: data => this.roundsTarget.innerHTML = data }
    )
  }

  next(e) {
    e.preventDefault();
    fetch(e.target.href, {headers: {"Accept": "text/html"}})
      .then(response => response.text())
      .then((data) => {
        document.querySelector('.prog-1').style.width="12%"
      })
  }
}
