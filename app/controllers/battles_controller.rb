class BattlesController < ApplicationController
  def show
    @battle = Battle.find(1)
    @deck1 = Deck.create(user_id: 1, monster_id: 1, battle_id: @battle.id, attack_id: 1, hp: 100)
    @deck2 = Deck.create(user_id: 2, monster_id: 2, battle_id: @battle.id, attack_id: 2, hp: 100)
    @battle.current_deck_id = @deck1.id
    @battle.save
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
