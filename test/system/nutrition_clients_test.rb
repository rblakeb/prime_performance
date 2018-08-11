require "application_system_test_case"

class NutritionClientsTest < ApplicationSystemTestCase
  setup do
    @nutrition_client = nutrition_clients(:one)
  end

  test "visiting the index" do
    visit nutrition_clients_url
    assert_selector "h1", text: "Nutrition Clients"
  end

  test "creating a Nutrition client" do
    visit nutrition_clients_url
    click_on "New Nutrition Client"

    click_on "Create Nutrition client"

    assert_text "Nutrition client was successfully created"
    click_on "Back"
  end

  test "updating a Nutrition client" do
    visit nutrition_clients_url
    click_on "Edit", match: :first

    click_on "Update Nutrition client"

    assert_text "Nutrition client was successfully updated"
    click_on "Back"
  end

  test "destroying a Nutrition client" do
    visit nutrition_clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nutrition client was successfully destroyed"
  end
end
