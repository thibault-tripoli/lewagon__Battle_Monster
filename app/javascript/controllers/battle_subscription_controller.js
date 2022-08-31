import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { deckId: Number }
  static targets = ["round", "rounds"]

  connect() {
    console.log(`Subscribed to the deck #${this.deckIdValue}.`)
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
        console.log("data2", data)
      })
  }
}
