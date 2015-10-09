require 'rails_helper'

RSpec.describe Event, type: :model do
  context "#associations" do
  it {should belong_to :host}
  it {should have_many :rsvps}
  it {should have_many :guests}
  it {should have_many :comments}
  it {should have_many :commenters}
  it {should validate_presence_of :public_location}
  it {should validate_presence_of :city}
  it {should validate_presence_of :state}
  it {should validate_presence_of :zip}
  it {should validate_presence_of :max_size}
  it {should validate_presence_of :time_start}
  it {should validate_presence_of :time_end}
  it {should validate_presence_of :name}
  it {should validate_presence_of :description}
  it {should validate_presence_of :category}
  it {should validate_length_of(:state).is_equal_to(2)}
end

end