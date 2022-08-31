class BattlesController < ApplicationController
  def show
    @battle = Battle.first
    @deck1 = Deck.first
    @deck2 = Deck.second
    # toas = rand(1..2)
    # @battle.current_deck = toas == 1 ? @deck1 : @deck2
    @current_deck = @battle.current_deck
    @next_deck = @deck2 if current_user == @deck1.user
    @next_deck = @deck1 if current_user == @deck2.user
  end

  def next_round
    @battle = Battle.find(params[:battle_id])
    @battle.round += 1
    @battle.current_deck = Deck.find(params[:id])
    @battle.current_deck.hp -= 25
    @battle.current_deck.save
    if @battle.save
      redirect_to battle_path(@battle)
    else
      render :show, status: :unprocessable_entity
    end
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
