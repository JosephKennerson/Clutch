# require "rails_helper"
# require "pry"
# require "date"
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# RSpec.describe 'events/new.html.erb', type: :view do
#     # let(current_user){User.first}
#     it 'allows the user to create an event, submit and view the event' do
#       visit '/events/new'
#         click_on 'Events'
#         click_on 'New Event'
#         fill_in "Event name", with: "Volleyball League"
#         fill_in "Description", with: "This is a fall League for intermediate level Volleyball players"
#         fill_in "Max size", with: "11"
#         fill_in "Public location", with: "Los Gatos High School"
#         fill_in "Address Line 1", with: "20 High School Ct"
#         fill_in "Address line 2", with: ""
#         fill_in "City", with: "Los Gatos, CA 95030"
#         fill_in "State", with: "CA"
#         fill_in "Zip", with: "95030"
#         select(DateTime.now, :from => 'Time start')
#         select_date_and_time(2.days.from_now, from:"Time end")
#         click_on "Create Event"
#       # expect(page).to have_content("Delete")
#     end
#   end