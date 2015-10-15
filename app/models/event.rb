# require 'elasticsearch/model'

class Event < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

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

  geocoded_by :full_address # full_address is a method which take some model's attributes to get a formatted address for example

  # the callback to set longitude and latitude
  after_validation :geocode, if: :full_address_changed?

  # the full_address method
  def full_address
    "#{address_line_1}, #{address_line_2}, #{city}, #{state}, #{zip}"
  end

  def full_address_changed?
    :address_line_1_changed? || :address_line_2_changed? || :city_changed? || :state_changed? || :zip_changed?
  end

  def current_count
    self.rsvps.where(confirmed: true).length
  end

  # settings index: { number_of_shards: 1 } do
  # mappings dynamic: 'false' do
  #   indexes :name, analyzer: 'english'
  #   indexes :description, analyzer: 'english'
  #   indexes :category, analyzer: 'english'
  # end
end

# def self.search(query)
#   __elasticsearch__.search(
#     {
#       highlight: {
#         pre_tags: ['<em>'],
#         post_tags: ['</em>'],
#         fields: {
#           title: {},
#           text: {}
#         }
#       }
#     }
#   )
# end
# end

# Event.import

