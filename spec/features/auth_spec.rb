require 'spec_helper'
require 'rails_helper'

describe "GoalsApp" do
  let(:test_user) { FactoryGirl.create(:user) }

  def fill_in_user_info
    fill_in "Username", with: test_user.username
    fill_in "Password", with: test_user.password
  end

  feature "the signup process" do
  # let(:test_user) { FactoryGirl.create(:user) }

    before :each do
      visit "/users/new"
      fill_in_user_info
    end

    it "has a new user page" do
      expect(page).to have_content("Sign Up")
    end

    feature "signing up a user" do

      it "shows username on the homepage after signup" do
        # fill_in "Username", with: test_user.username
        # fill_in "Password", with: test_user.password
        click_button "Sign Up"
        expect(page).to have_content(test_user.username)
      end
    end

  end

  feature "logging in" do
  # let(:test_user) { FactoryGirl.create(:user) }

    before :each do
      visit new_session_url
      fill_in_user_info
      click_button "Sign In"
    end

    it "shows username on the homepage after login" do
      expect(page).to have_content(test_user.username)
    end

  end

  feature "logging out" do

    it "begins with logged out state" do
      visit new_session_url
      expect(page).not_to have_content(test_user.username)
    end

    it "doesn't show username on the homepage after logout"

  end

end
