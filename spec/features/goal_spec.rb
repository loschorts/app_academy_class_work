require 'spec_helper'
require 'rails_helper'

describe "GoalsApp" do
  let(:test_user) { FactoryGirl.create(:user) }

  def sign_up(user)
    visit "/users/new"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign Up"
  end

  feature "the goal creation process" do

    before :each do
      sign_up(test_user)
    end

    it "shows goals index on user sign in" do
      expect(page).to have_current_path(goals_path)
    end

    it "has a link to the new goal page" do
      expect(page).to have_link("Create New Goal")
    end

    it "has a form for adding new goals" do
      click_link "Create New Goal"
      expect(page).to have_field("Goal")
      expect(page).to have_selector(
      'input[type=radio][name="goal[priv]"]')
    end

    it "shows created goals on goal index" do
      click_link "Create New Goal"
      fill_in "Goal", with: 'Lose weight'
      click_button "Submit"
      expect(page).to have_content("Lose weight")
    end

    let(:new_user) { FactoryGirl.create(:user) }
    it "doesn't show other users' private goals" do
      click_link "Create New Goal"
      fill_in "Goal", with: 'Lose weight'
      choose "Private"
      click_button "Submit"
      click_button "Log Out"

      sign_up(new_user)
      expect(page).not_to have_content("Lose weight")
    end

  end
end
