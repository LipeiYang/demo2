require 'test_helper'

class OrderFiltersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_filters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_filter" do
    assert_difference('OrderFilter.count') do
      post :create, :order_filter => { }
    end

    assert_redirected_to order_filter_path(assigns(:order_filter))
  end

  test "should show order_filter" do
    get :show, :id => order_filters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => order_filters(:one).to_param
    assert_response :success
  end

  test "should update order_filter" do
    put :update, :id => order_filters(:one).to_param, :order_filter => { }
    assert_redirected_to order_filter_path(assigns(:order_filter))
  end

  test "should destroy order_filter" do
    assert_difference('OrderFilter.count', -1) do
      delete :destroy, :id => order_filters(:one).to_param
    end

    assert_redirected_to order_filters_path
  end
end
