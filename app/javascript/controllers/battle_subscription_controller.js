import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { deckId: Number }
  static targets = ["round", "rounds"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "DeckChannel", id: this.deckIdValue },
      { received: data => {
          const json = JSON.parse(data)
          this.roundsTarget.innerHTML = json.html
          if (json.attack == 1) {
            const monster = document.querySelector('#arena-deck-1-monster')
            const roundControl = document.querySelector('#round-controls')
            const arenaAttack1 = document.querySelector('#arena-attack-1')
            // start
            monster.classList.add('attack')
            roundControl.classList.add('controls-off')
            // cascade
            monster.addEventListener("animationend", function(){
              monster.classList.remove('attack')
              arenaAttack1.classList.add('attack-in')
            });
            // titre.addEventListener("animationend", goToHurt);
            // monster.addEventListener("animationend", goToHp);

            // document.querySelector('#arena-deck-1-monster').style.fontSize="50px"
            // document.querySelector('#arena-deck-2-monster').style.fontSize="20px"
            // document.querySelector('.prog-2').style.width="" + json.deck2_HP + "%"
          } else if (json.attack == 2) {
            document.querySelector('#arena-deck-1-monster').style.fontSize="20px"
            document.querySelector('#arena-deck-2-monster').style.fontSize="50px"
            document.querySelector('.prog-1').style.width="" + json.deck1_HP + "%"

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
