require 'test_helper'

class NutritionClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nutrition_client = nutrition_clients(:one)
  end

  test "should get index" do
    get nutrition_clients_url
    assert_response :success
  end

  test "should get new" do
    get new_nutrition_client_url
    assert_response :success
  end

  test "should create nutrition_client" do
    assert_difference('NutritionClient.count') do
      post nutrition_clients_url, params: { nutrition_client: {  } }
    end

    assert_redirected_to nutrition_client_url(NutritionClient.last)
  end

  test "should show nutrition_client" do
    get nutrition_client_url(@nutrition_client)
    assert_response :success
  end

  test "should get edit" do
    get edit_nutrition_client_url(@nutrition_client)
    assert_response :success
  end

  test "should update nutrition_client" do
    patch nutrition_client_url(@nutrition_client), params: { nutrition_client: {  } }
    assert_redirected_to nutrition_client_url(@nutrition_client)
  end

  test "should destroy nutrition_client" do
    assert_difference('NutritionClient.count', -1) do
      delete nutrition_client_url(@nutrition_client)
    end

    assert_redirected_to nutrition_clients_url
  end
end
