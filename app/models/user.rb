class User < ActiveRecord::Base
  has_many :rsvps, foreign_key: :guest_id
  has_many :events, foreign_key: :host_id
  has_many :comments
  has_many :ratings
  has_many :given_ratings, through: :ratings, source: :rater
  has_many :received_ratings, through: :ratings, source: :ratee
end
