class Rsvp < ActiveRecord::Base
  belongs_to :guest, class_name: "User"
  belongs_to :event
  validates :guest_id, :event_id, presence: true
end
