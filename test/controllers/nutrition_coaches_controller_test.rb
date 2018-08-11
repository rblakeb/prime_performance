require 'test_helper'

class NutritionCoachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nutrition_coach = nutrition_coaches(:one)
  end

  test "should get index" do
    get nutrition_coaches_url
    assert_response :success
  end

  test "should get new" do
    get new_nutrition_coach_url
    assert_response :success
  end

  test "should create nutrition_coach" do
    assert_difference('NutritionCoach.count') do
      post nutrition_coaches_url, params: { nutrition_coach: { email: @nutrition_coach.email, name: @nutrition_coach.name } }
    end

    assert_redirected_to nutrition_coach_url(NutritionCoach.last)
  end

  test "should show nutrition_coach" do
    get nutrition_coach_url(@nutrition_coach)
    assert_response :success
  end

  test "should get edit" do
    get edit_nutrition_coach_url(@nutrition_coach)
    assert_response :success
  end

  test "should update nutrition_coach" do
    patch nutrition_coach_url(@nutrition_coach), params: { nutrition_coach: { email: @nutrition_coach.email, name: @nutrition_coach.name } }
    assert_redirected_to nutrition_coach_url(@nutrition_coach)
  end

  test "should destroy nutrition_coach" do
    assert_difference('NutritionCoach.count', -1) do
      delete nutrition_coach_url(@nutrition_coach)
    end

    assert_redirected_to nutrition_coaches_url
  end
end
