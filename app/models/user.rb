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
  has_many :events_requested_to, through: :rsvps, source: :event
  has_many :comments
  has_many :ratings
  has_many :given_ratings, class_name: "Rating", foreign_key: "rater_id"
  has_many :received_ratings, class_name: "Rating", foreign_key: "ratee_id"

  def confirmed_events(userid)
    attending_events = []
    Rsvp.where(guest_id: userid, confirmed: true).each do |rsvp|
      attending_events << Event.find(rsvp.event_id)
    end
    return attending_events
  end

end
