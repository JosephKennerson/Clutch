require 'rails_helper'

RSpec.describe Rating, type: :model do
  context "#associations" do
  it {should belong_to :event}
  it {should belong_to :rater}
  it {should belong_to :ratee}
  it {should validate_presence_of(:rating)}
  it {should validate_presence_of(:rating_feedback)}
end

end