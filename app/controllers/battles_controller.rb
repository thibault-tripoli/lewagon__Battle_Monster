class BattlesController < ApplicationController
  def show
    @battle = Battle.first
    @deck1 = Deck.first
    @deck2 = Deck.second
    # toas = rand(1..2)
    # @battle.current_deck = toas == 1 ? @deck1 : @deck2
    @current_deck = @battle.current_deck
    if current_user == @deck1.user
      @next_deck = @deck2
      @my_deck = @deck1
    else
      @next_deck = @deck1
      @my_deck = @deck2
    end
  end

  def next_round
    @battle = Battle.find(params[:battle_id])
    @deck1 = Deck.first
    @deck2 = Deck.second

    if current_user == @deck1.user
      @next_deck = @deck2
      @my_deck = @deck1
    else
      @next_deck = @deck1
      @my_deck = @deck2
    end

    @battle.round += 1
    @next_deck.hp -= @my_deck.attack.damage
    @next_deck.save

    @current_deck = @battle.current_deck
    @current_deck = @next_deck
    @current_deck.save

    if @battle.save
      DeckChannel.broadcast_to(
        @deck1,
        render_to_string(partial: "round", locals: { battle: @battle, deck1: @deck1, deck2: @deck2, current_deck: @current_deck, next_deck: @next_deck, current_user: @deck1.user })
      )
      DeckChannel.broadcast_to(
        @deck2,
        render_to_string(partial: "round", locals: { battle: @battle, deck1: @deck1, deck2: @deck2, current_deck: @current_deck, next_deck: @next_deck, current_user: @deck2.user })
      )
      head :ok
      # redirect_to battle_path(@battle)
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
