require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do    
    User.create(first_name: "Hans", last_name: "Ng", email: "test@test.com", password: "12345", password_confirmation: "12345")
    @user = User.find_by_email("test@test.com");  # This is needed because we don't require database cleaner right now
  end


  scenario "Test user login", focus: true do
    # ACT
    visit login_path
    
    # save_screenshot
    fill_in 'email', with: "test@test.com"
    fill_in 'password', with: "12345"
    click_button "Login"

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_text 'Hans', count: 1
  end
  
end
