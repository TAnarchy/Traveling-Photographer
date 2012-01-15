require 'test_helper'

class TripIndependentInfosControllerTest < ActionController::TestCase
  setup do
    @trip_independent_info = trip_independent_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_independent_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_independent_info" do
    assert_difference('TripIndependentInfo.count') do
      post :create, :trip_independent_info => @trip_independent_info.attributes
    end

    assert_redirected_to trip_independent_info_path(assigns(:trip_independent_info))
  end

  test "should show trip_independent_info" do
    get :show, :id => @trip_independent_info.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @trip_independent_info.to_param
    assert_response :success
  end

  test "should update trip_independent_info" do
    put :update, :id => @trip_independent_info.to_param, :trip_independent_info => @trip_independent_info.attributes
    assert_redirected_to trip_independent_info_path(assigns(:trip_independent_info))
  end

  test "should destroy trip_independent_info" do
    assert_difference('TripIndependentInfo.count', -1) do
      delete :destroy, :id => @trip_independent_info.to_param
    end

    assert_redirected_to trip_independent_infos_path
  end
end
