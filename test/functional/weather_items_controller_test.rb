require 'test_helper'

class WeatherItemsControllerTest < ActionController::TestCase
  setup do
    @weather_item = weather_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weather_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather_item" do
    assert_difference('WeatherItem.count') do
      post :create, weather_item: @weather_item.attributes
    end

    assert_redirected_to weather_item_path(assigns(:weather_item))
  end

  test "should show weather_item" do
    get :show, id: @weather_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weather_item.to_param
    assert_response :success
  end

  test "should update weather_item" do
    put :update, id: @weather_item.to_param, weather_item: @weather_item.attributes
    assert_redirected_to weather_item_path(assigns(:weather_item))
  end

  test "should destroy weather_item" do
    assert_difference('WeatherItem.count', -1) do
      delete :destroy, id: @weather_item.to_param
    end

    assert_redirected_to weather_items_path
  end
end
