class RankingController < ApplicationController
  def index
    @ordered = User.order(wins: :desc)
  end
end
