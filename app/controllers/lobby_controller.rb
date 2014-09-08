class LobbyController < ApplicationController
  def index
    @created = current_user.created_games
    @played = current_user.played_games
    @free = Game.where(user2: nil)
  end
end
