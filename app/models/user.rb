class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  # Follows
  has_many :follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followed_users, through: :follows, source: :followed

  # Reverse follows
  has_many :reverse_follows, foreign_key: :followed_id, class_name: 'Follow'
  has_many :followers, through: :reverse_follows, source: :follower
end
