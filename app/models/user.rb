class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rsvps, foreign_key: :guest_id
  has_many :events, foreign_key: :host_id
  has_many :comments
  has_many :ratings
  has_many :given_ratings, through: :ratings, source: :rater
  has_many :received_ratings, through: :ratings, source: :ratee

  def given_reviews
    self.ratings.where(rater: self.id)
  end

  def received_feedback
    self.ratings.where(ratee: self.id)
  end

end
