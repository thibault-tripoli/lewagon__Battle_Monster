class BattlesController < ApplicationController
  def show
    @battle = Battle.find(1)
    @deck1 = Deck.find(1)
    @deck2 = Deck.find(2)
    toas = rand(1..2)
    @battle.current_deck = toas == 1 ? @deck1 : @deck2
    @battle.save!
    @current_deck = @battle.current_deck
  end

  def new
  end

  def create
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
