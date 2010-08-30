require 'test_helper'

class CostItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cost_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cost_item" do
    assert_difference('CostItem.count') do
      post :create, :cost_item => { }
    end

    assert_redirected_to cost_item_path(assigns(:cost_item))
  end

  test "should show cost_item" do
    get :show, :id => cost_items(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cost_items(:one).to_param
    assert_response :success
  end

  test "should update cost_item" do
    put :update, :id => cost_items(:one).to_param, :cost_item => { }
    assert_redirected_to cost_item_path(assigns(:cost_item))
  end

  test "should destroy cost_item" do
    assert_difference('CostItem.count', -1) do
      delete :destroy, :id => cost_items(:one).to_param
    end

    assert_redirected_to cost_items_path
  end
end
