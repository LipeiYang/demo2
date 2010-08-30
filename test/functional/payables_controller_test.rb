require 'test_helper'

class PayablesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payable" do
    assert_difference('Payable.count') do
      post :create, :payable => { }
    end

    assert_redirected_to payable_path(assigns(:payable))
  end

  test "should show payable" do
    get :show, :id => payables(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => payables(:one).to_param
    assert_response :success
  end

  test "should update payable" do
    put :update, :id => payables(:one).to_param, :payable => { }
    assert_redirected_to payable_path(assigns(:payable))
  end

  test "should destroy payable" do
    assert_difference('Payable.count', -1) do
      delete :destroy, :id => payables(:one).to_param
    end

    assert_redirected_to payables_path
  end
end
