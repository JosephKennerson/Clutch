class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rsvps
  has_many :events
  has_many :comments
  has_many :ratings
  has_many :given_ratings, through: :ratings, source: :rater
  has_many :received_ratings, through: :ratings, source: :ratee
end
