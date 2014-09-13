class LobbyController < ApplicationController
  def index
    #@created = current_user.created_games
    @created = Game.where(status: [0, 1, 2])
    @played = current_user.played_games.where(status: 0)
    @free = Game.where(user2: nil)
  end
end
