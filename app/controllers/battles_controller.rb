class BattlesController < ApplicationController
  def match
    # j'instancie la battle
    # je trouve un user connecté
    # je valide le match
  end

  def create
    # j'enregistre la battle
    # je redirige vers setup
  end

  def setup
    @battle = Battle.find(params[:battle_id])
    @setup_deck = @battle.decks.where(user_id: current_user).first
    @setup_deck.monster = current_user.monsters.first
    @setup_deck.save
    @setup_specie = @setup_deck.monster.specie
  end

  def loading
    @battle = Battle.find(params[:battle_id])
    @battle.current_deck = @battle.decks.first
    @battle.save
    select_deck
    respond_to do |format|
      format.html
      format.json do
        render json: {
          html: render_to_string(partial: 'load', locals: { battle: @battle, deck1: @deck1, deck2: @deck2 }, formats: [:html])
        }
      end
    end
  end

  def show
    @battle = Battle.find(params[:id])
    @current_deck = @battle.current_deck
    select_deck
  end

  def next_round
    @battle = Battle.find(params[:battle_id])
    select_deck

    if (@next_deck.hp - current_attack.damage).positive?
      @battle.round += 1
      @next_deck.hp -= current_attack.damage
    else
      @next_deck.hp = 0
    end
    @next_deck.save

    @current_deck = @battle.current_deck
    @current_deck = @next_deck
    @current_deck.save

    if @battle.save
      deck1_html = render_to_string(partial: "round", locals: { battle: @battle, deck1: @deck1, deck2: @deck2, current_deck: @current_deck, next_deck: @next_deck, current_user: @deck1.user })
      DeckChannel.broadcast_to(
        @deck1,
        { html: deck1_html, deckID: @my_deck.id, deck1_HP: @deck1.hp, deck2_HP: @deck2.hp, current_attack: current_attack }.to_json
      )
      deck2_html = render_to_string(partial: "round", locals: { battle: @battle, deck1: @deck1, deck2: @deck2, current_deck: @current_deck, next_deck: @next_deck, current_user: @deck2.user })
      DeckChannel.broadcast_to(
        @deck2,
        { html: deck2_html, deckID: @my_deck.id, deck1_HP: @deck1.hp, deck2_HP: @deck2.hp, current_attack: current_attack }.to_json
      )
      head :ok
      # redirect_to battle_path(@battle)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    @battle = Battle.find(params[:id])
    @battle.update(game_over)
    @battle.status = "finish"
    if @battle.save!
      redirect_to page_main_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def select_deck
    @deck1 = @battle.decks.first
    @deck2 = @battle.decks.last
    if current_user == @deck1.user
      @next_deck = @deck2
      @my_deck = @deck1

    else
      @next_deck = @deck1
      @my_deck = @deck2
    end
  end

  def current_attack
    case params[:attack]
    when 'one'
      @my_deck.attack_one
    when 'two'
      @my_deck.attack_two
    when 'three'
      @my_deck.attack_three
    end
  end

  def game_over
    params.require(:battle).permit(:winner_id)
  end
end
