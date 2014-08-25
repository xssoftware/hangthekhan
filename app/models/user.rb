class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_games, class_name: "Game", foreign_key: "user1_id"
  has_many :played_games, class_name: "Game", foreign_key: "user2_id"
end
