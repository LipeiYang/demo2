require 'test_helper'

class InvestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invest" do
    assert_difference('Invest.count') do
      post :create, :invest => { }
    end

    assert_redirected_to invest_path(assigns(:invest))
  end

  test "should show invest" do
    get :show, :id => invests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => invests(:one).to_param
    assert_response :success
  end

  test "should update invest" do
    put :update, :id => invests(:one).to_param, :invest => { }
    assert_redirected_to invest_path(assigns(:invest))
  end

  test "should destroy invest" do
    assert_difference('Invest.count', -1) do
      delete :destroy, :id => invests(:one).to_param
    end

    assert_redirected_to invests_path
  end
end
