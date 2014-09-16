class Game < ActiveRecord::Base
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  belongs_to :word
  belongs_to :statistic

  has_many :moves, dependent: :destroy

  def make_move(user, char)
    return if user != user2
    return if (status == 1) || (status == 2)
    current_word = word.word.downcase

    return "Letter already used" if moves.where(char: char).any?

    res = moves.create(char: char)
    if mistakes >= 6
      self.status = 2
      save
    elsif !current_state.include? "*"
      self.status = 1
      save
    end
    res
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
    current_word = word.word.downcase
    result = 0
    moves.each do |move|
      result += 1 unless current_word.include? move.char
    end
    result
  end
end
