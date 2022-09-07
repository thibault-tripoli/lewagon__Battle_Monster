class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def profil
    @user = User.find(params[:id])
    @battles = Deck.where(user_id: @user)
    @victory = Battle.where(winner_id: @user)
  end

  def start_monster
    @monster = Monster.new
  end
end
