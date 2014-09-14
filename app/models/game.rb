class Game < ActiveRecord::Base
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  belongs_to :word
  belongs_to :statistic

  has_many :moves, dependent: :destroy

  #variables to hold used letters and mistakes
  $used_letters = ""
  $mistaken = 0

  def make_move(user, char)
    return if user != user2
    return if (status == 1) or (status == 2)
    current_word = word.word.downcase

    return "Letter already used" if moves.where(char: char).any?

    $mistaken += 1 unless current_word.include? char
    if $mistaken >= 6
      return "Game over"
    else
      return moves.create(char: char)
    end
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

  def mistakes
    return $mistaken
  end

end
