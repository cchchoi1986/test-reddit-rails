class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # a user has many posts
  has_many :posts

  # a user has many comments
  has_many :comments

  has_many :post_votes
end
