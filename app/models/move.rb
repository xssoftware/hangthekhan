class Move < ActiveRecord::Base
  belongs_to :game

  validates :char, length: { in: 1..1 }
end
