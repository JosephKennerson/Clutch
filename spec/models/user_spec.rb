require 'rails_helper'

RSpec.describe User, type: :model do
  context "#associations" do
  it {should have_many :comments}
  it {should have_many :rsvps}
  it {should have_many :events}
  it {should have_many :given_ratings}
  it {should have_many :received_ratings}
  it {should have_many :events_requested_to}
  end
end