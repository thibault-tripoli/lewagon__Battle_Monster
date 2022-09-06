class DecksController < ApplicationController
  def update
    @setup_deck = Deck.find(params[:id])
    @setup_deck.update(setup_params)
    @setup_deck.empty = false
    if @setup_deck.save
      redirect_to battle_loading_path(@setup_deck.battle)
    else
      # ?
      render battle_setup_path(@setup_deck), status: :unprocessable_entity
    end
  end

  private

  def setup_params
    params.require(:deck).permit(:attack_one_id, :attack_two_id, :attack_three_id)
  end
end
