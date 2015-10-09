require 'rails_helper'

RSpec.describe Event, type: :model do
  context "#associations" do
  it {should belong_to :host}
  it {should have_many :rsvps}
  it {should have_many :guests}
  it {should have_many :comments}
  it {should have_many :commenters}
end

end