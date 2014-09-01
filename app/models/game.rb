class Game < ActiveRecord::Base
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  belongs_to :word

  has_many :moves, dependent: :destroy
  has_many :statuses, dependent: :destroy
  validates :status, numericality: { only_integer: true }
end
