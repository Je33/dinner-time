require "test_helper"

class RecipeControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get recipe_upload_url
    assert_response :success
  end

  test "should get get_all_by_ingredients" do
    get recipe_get_all_by_ingredients_url
    assert_response :success
  end
end
