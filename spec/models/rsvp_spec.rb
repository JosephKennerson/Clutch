require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  context "#associations" do
  it {should belong_to :guest}
  it {should belong_to :event}
  it {should validate_presence_of(:guest_id)}
  it {should validate_presence_of(:event_id)}
end

end