class BattlesController < ApplicationController
  def show
    @battle = Battle.find(1)
    @deck1 = Deck.find(1)
    @deck2 = Deck.find(2)
    toas = rand(1..2)
    toas == 1 ? deck = @deck1 : deck = @deck2
    @battle.current_deck_id = deck.id
    @battle.save
    @current_deck = Deck.find(@battle.current_deck_id)
    @round = 0
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

  def current_deck
  end
end
