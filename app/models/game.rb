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

  def current_state
    current = ""
    current_word = word.word.downcase
    current_word.length.times do |i|
      char = current_word[i]
      if moves.where(char: char).any?
        current += char
      else
        current += "*"
      end
    end
    current
  end
end
