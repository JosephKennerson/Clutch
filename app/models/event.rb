require 'elasticsearch/model'

class Event < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :host, class_name: "User"
  has_many :rsvps
  has_many :guests, through: :rsvps, source: :guest
  has_many :comments
  has_many :commenters, through: :comments, source: :user
  validates :public_location, :city, :state, :zip, :max_size, :time_start, :time_end, :name, :description, :category, presence: true
  validates :state, length: { is: 2 }


 	def close_event
 		self.status = false if self.rsvps.where(confirmed: true).length >= self.max_size || self.time_end.past? == true
 		self.save
 	end

end

Event.import