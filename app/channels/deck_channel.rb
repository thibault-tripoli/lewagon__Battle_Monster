class DeckChannel < ApplicationCable::Channel
  def subscribed
    deck = Deck.find(params[:id])
    # battle = Battle.first
    stream_for deck
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
