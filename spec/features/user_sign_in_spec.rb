require 'rails_helper'

RSpec.feature "User Sign-In", type: :feature do
  let(:user) { create(:user) }

  scenario "Successful Sign-In" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content("Products")
  end
end