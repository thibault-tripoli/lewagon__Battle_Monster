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
          const monster1 = document.querySelector('#arena-deck-1-monster')
          const monster2 = document.querySelector('#arena-deck-2-monster')
          const roundControl = document.querySelector('#round-controls')

          if (json.attack == 1) {

            const arenaAttack1 = document.querySelector('#arena-attack-1')
            // start
            monster1.classList.add('attack')
            roundControl.classList.add('controls-off')
            // cascade
            monster1.addEventListener("animationend", function(){
              monster1.classList.remove('attack')
              arenaAttack1.classList.add('attack-in')
            });

            arenaAttack1.addEventListener("animationend", function(){
              arenaAttack1.classList.remove('attack-in')
              monster2.classList.add('hurt')
            });

            monster2.addEventListener("animationend", function(){
              monster2.classList.remove('hurt')
              document.querySelector('.prog-2').style.width="" + json.deck2_HP + "%"
              roundControl.classList.remove('controls-off')
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
