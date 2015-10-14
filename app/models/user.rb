class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :rsvps, foreign_key: :guest_id
  has_many :events, foreign_key: :host_id
  has_many :comments
  has_many :ratings
  has_many :given_ratings, class_name: "Rating", foreign_key: "rater_id"
  has_many :received_ratings, class_name: "Rating", foreign_key: "ratee_id"

  # def given_reviews
  #   self.ratings.where(rater: self.id)
  # end

  # def received_feedback
  #   self.ratings.where(ratee: self.id)
  # end

# ***** Original Facebook Login Auth ******
  # def self.from_omniauth(auth)
  #     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.email = auth.info.email
  #       user.password = Devise.friendly_token[0,20]
  #     end
  # end

# ***** Facebook Login Auth ******
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email || "#{auth.info.nickname}@facebook.com"
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
  end
end

end
