require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "#associations" do
  it {should belong_to :event}
  it {should belong_to :user}
  it {should validate_presence_of :body}
end

end