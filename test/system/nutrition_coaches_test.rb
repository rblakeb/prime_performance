require "application_system_test_case"

class NutritionCoachesTest < ApplicationSystemTestCase
  setup do
    @nutrition_coach = nutrition_coaches(:one)
  end

  test "visiting the index" do
    visit nutrition_coaches_url
    assert_selector "h1", text: "Nutrition Coaches"
  end

  test "creating a Nutrition coach" do
    visit nutrition_coaches_url
    click_on "New Nutrition Coach"

    fill_in "Email", with: @nutrition_coach.email
    fill_in "Name", with: @nutrition_coach.name
    click_on "Create Nutrition coach"

    assert_text "Nutrition coach was successfully created"
    click_on "Back"
  end

  test "updating a Nutrition coach" do
    visit nutrition_coaches_url
    click_on "Edit", match: :first

    fill_in "Email", with: @nutrition_coach.email
    fill_in "Name", with: @nutrition_coach.name
    click_on "Update Nutrition coach"

    assert_text "Nutrition coach was successfully updated"
    click_on "Back"
  end

  test "destroying a Nutrition coach" do
    visit nutrition_coaches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nutrition coach was successfully destroyed"
  end
end
