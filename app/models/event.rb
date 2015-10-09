class Event < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  has_many :rsvps
  has_many :guests, through: :rsvps, source: :user
  has_many :comments
  has_many :commenters, through: :comments, source: :user
end
