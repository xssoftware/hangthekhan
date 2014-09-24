class LobbyController < ApplicationController
  def index
    @created = Game.where(status: [0, 1, 2], user1: current_user)
    @played = current_user.played_games.where(status: 0)
    @free = Game.where(user2: nil)
  end
end
