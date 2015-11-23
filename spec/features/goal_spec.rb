require 'spec_helper'
require 'rails_helper'

describe "GoalsApp" do
  let(:test_user) { FactoryGirl.create(:user) }

  def sign_in_test_user
    visit "/users/new"
    fill_in "Username", with: test_user.username
    fill_in "Password", with: test_user.password
    click_button "Sign Up"
  end

  feature "the goal creation process" do

    before :each do
      sign_in_test_user
    end

    it "shows goals index on user sign in" do
      expect(page).to have_current_path(goals_url)
    end

    it "has a link to the new goal page" do
      expect(page).to have_link("Create New Goal")
    end

    it "has a form for adding new goals" do
      click_link "Create New Goal"
      expect(page).to have_field("Goal")
    end

    it "shows created goals on goal index" do
      click_link "Create New Goal"
      fill_in "Goal", with: 'Lose weight'
      click_button "Submit"
      expect(page).to have("Lose weight")
    end

  end
end
