require 'test_helper'

class TravelDataControllerTest < ActionController::TestCase
  setup do
    @travel_datum = travel_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_datum" do
    assert_difference('TravelDatum.count') do
      post :create, :travel_datum => @travel_datum.attributes
    end

    assert_redirected_to travel_datum_path(assigns(:travel_datum))
  end

  test "should show travel_datum" do
    get :show, :id => @travel_datum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @travel_datum.to_param
    assert_response :success
  end

  test "should update travel_datum" do
    put :update, :id => @travel_datum.to_param, :travel_datum => @travel_datum.attributes
    assert_redirected_to travel_datum_path(assigns(:travel_datum))
  end

  test "should destroy travel_datum" do
    assert_difference('TravelDatum.count', -1) do
      delete :destroy, :id => @travel_datum.to_param
    end

    assert_redirected_to travel_data_path
  end
end
