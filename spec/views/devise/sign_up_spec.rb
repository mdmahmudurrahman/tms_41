require "rails_helper"

describe User, "sign up" do
  feature "sign up" do
    let(:user) {FactoryGirl.create :supervisor}

    scenario "Successful sign up" do
      visit "/users/sign_up"
      fill_in "user_name", with: "Mahmud"
      fill_in "user_email", with: "mailto@gmail.com"
      fill_in "user_password", with: "mahmud321"
      fill_in "user_password_confirmation", with: "mahmud321"
      click_button "Create"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario "Sign up failed with email already exist." do
      visit "users/sign_up"
      fill_in "user_name", with: user.name
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password_confirmation
      click_button "Create"
      expect(page).to have_content "Email has already been taken"
    end
  end
end