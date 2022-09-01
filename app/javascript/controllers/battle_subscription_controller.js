import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { deckId: Number }
  static targets = ["round", "rounds"]

  sleep(milliseconds) {
    const date = Date.now();
    let currentDate = null;
    do {
      currentDate = Date.now();
    } while (currentDate - date < milliseconds);
  }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "DeckChannel", id: this.deckIdValue },
      { received: data => {
          const json = JSON.parse(data)
          this.roundsTarget.innerHTML = json.html
          const roundControl = document.querySelector('#round-controls')

          const monster1 = document.querySelector('#arena-deck-1-monster')
          const monster2 = document.querySelector('#arena-deck-2-monster')
          const arenaAttack1 = document.querySelector('#arena-attack-1')
          const arenaAttack2 = document.querySelector('#arena-attack-2')

          if (json.attack == 1) {

            // start
            monster1.classList.add('attack')
            roundControl.classList.add('controls-off')
            // cascade
            monster1.addEventListener("animationend", function(){
              arenaAttack1.classList.add('attack-1')
            });

            arenaAttack1.addEventListener("animationend", function(){
              monster2.classList.add('hurt')
            });

            monster2.addEventListener("animationend", function(){
              document.querySelector('.prog-2').style.width="" + json.deck2_HP + "%"
            });

            document.querySelector('#progress2').addEventListener("transitionend", function(){
              roundControl.classList.remove('controls-off')
              arenaAttack1.classList.remove('attack-1')
              monster2.classList.remove('hurt')
              monster1.classList.remove('attack')
              arenaAttack2.classList.remove('attack-2')
              monster1.classList.remove('hurt')
              monster2.classList.remove('attack')
            });

          } else if (json.attack == 2) {

            monster2.classList.add('attack')
            roundControl.classList.add('controls-off')
            // cascade
            monster2.addEventListener("animationend", function(){
              arenaAttack2.classList.add('attack-2')
            });

            arenaAttack2.addEventListener("animationend", function(){
              monster1.classList.add('hurt')
            });

            monster1.addEventListener("animationend", function(){
              document.querySelector('.prog-1').style.width="" + json.deck1_HP + "%"
            });

            document.querySelector('#progress1').addEventListener("transitionend", function(){
              roundControl.classList.remove('controls-off')
              arenaAttack2.classList.remove('attack-2')
              monster1.classList.remove('hurt')
              monster2.classList.remove('attack')
              arenaAttack1.classList.remove('attack-1')
              monster2.classList.remove('hurt')
              monster1.classList.remove('attack')
            });

          }
        }
      }
    )
  }

  next(e) {
    e.preventDefault();
    fetch(e.target.href, {headers: {"Accept": "text/html"}})
      .then(response => response.text())
      .then((data) => {
        // console.log('data2', data)
      })
  }

}
