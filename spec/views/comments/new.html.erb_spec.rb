# require "rails_helper"
# require "pry"
# require "date"
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# RSpec.describe 'events/comments.new.erb', type: :view, js: true do
#     # let(current_user){User.first}
#     it 'allows the user to create a comment, submit and view the event' do
#       visit '/events/comments'
#         click_on 'Comments'
#         click_on 'New Comment'
#         fill_in "Event", with: "Volleyball League"
#         fill_in "User", with: "nruthya@yahoo.com"
#         check('Is private')
#         uncheck('Is private')
#         fill_in "Body", with: "Playing Volleyball with you guys was so fun."
#         click_on "Create Comment"
#         # expect(page).to have_content("Delete")
#     end
#   end