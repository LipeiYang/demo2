require 'test_helper'

class HistoryPointsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:history_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create history_point" do
    assert_difference('HistoryPoint.count') do
      post :create, :history_point => { }
    end

    assert_redirected_to history_point_path(assigns(:history_point))
  end

  test "should show history_point" do
    get :show, :id => history_points(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => history_points(:one).to_param
    assert_response :success
  end

  test "should update history_point" do
    put :update, :id => history_points(:one).to_param, :history_point => { }
    assert_redirected_to history_point_path(assigns(:history_point))
  end

  test "should destroy history_point" do
    assert_difference('HistoryPoint.count', -1) do
      delete :destroy, :id => history_points(:one).to_param
    end

    assert_redirected_to history_points_path
  end
end
