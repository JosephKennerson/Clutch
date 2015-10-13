require 'rails_helper'

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

describe "Event", js:true do
  it "can see the events page" do
    visit root_path
  end
end