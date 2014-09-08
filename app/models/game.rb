class Game < ActiveRecord::Base
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  belongs_to :word
  belongs_to :statistic

  has_many :moves, dependent: :destroy

  def make_move(user, char)
    return if user != user2
    return moves.create(char: char)
  end

end
