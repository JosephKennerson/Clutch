require 'elasticsearch/model'

class Event < ActiveRecord::Base
  searchkick
  # locations: ["public_location"]
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :host, class_name: "User"
  has_many :rsvps
  has_many :guests, through: :rsvps, source: :guest
  has_many :comments
  has_many :commenters, through: :comments, source: :user
  validates :public_location, :city, :state, :zip, :max_size, :time_start, :time_end, :name, :description, :category, presence: true
  validates :state, length: { is: 2 }

  # def search_data
  #   attributes.merge location: [latitude, longitude]
  # end

  # def self.facets_search(params)
  #   query = params[:query].presence || "*"
  #   conditions = {}
  #   conditions[:category] = params[:category] if params[:category].present?

  #   events = Event.search query, where: conditions,
  #     facets: [:category],
  #     smart_facets: true, page: params[:page], suggest: true, highlight: true,
  #     per_page: 10
  #   events
  # end

 	def close_event
 		self.status = false if self.rsvps.where(confirmed: true).length >= self.max_size || self.time_end.past? == true
 		self.save
 	end

  def current_count
    self.rsvps.where(confirmed: true).length
  end

  settings index: { number_of_shards: 1 } do
  mappings dynamic: 'false' do
    indexes :name, analyzer: 'english'
    indexes :description, analyzer: 'english'
    indexes :category, analyzer: 'english'
  end
end

def self.search(query)
  __elasticsearch__.search(
    {
      highlight: {
        pre_tags: ['<em>'],
        post_tags: ['</em>'],
        fields: {
          title: {},
          text: {}
        }
      }
    }
  )
end

end

Event.import

