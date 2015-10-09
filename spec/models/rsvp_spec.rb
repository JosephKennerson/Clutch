require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  context "#associations" do
  it {should belong_to :guest}
  it {should belong_to :event}

end

end