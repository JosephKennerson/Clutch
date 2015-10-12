# require "rails_helper"
# require "pry"
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# RSpec.describe 'users/new.html.erb', type: :view, js: true do
#   context 'Signed in User' do
#     before(:each) do
#       visit root_path
#       within(:css, "p.navbar-text") do
#         click_on('Sign up')
#       end
#       fill_in "Email", with: "hunter@hunter.com"
#       fill_in "Password", with: "password"
#       fill_in "Password confirmation", with: "password"
#       within(:css, "form") do
#         click_on('Sign up')
#       end
#     end
#   end
# end