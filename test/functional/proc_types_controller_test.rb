require 'test_helper'

class ProcTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proc_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proc_type" do
    assert_difference('ProcType.count') do
      post :create, :proc_type => { }
    end

    assert_redirected_to proc_type_path(assigns(:proc_type))
  end

  test "should show proc_type" do
    get :show, :id => proc_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => proc_types(:one).to_param
    assert_response :success
  end

  test "should update proc_type" do
    put :update, :id => proc_types(:one).to_param, :proc_type => { }
    assert_redirected_to proc_type_path(assigns(:proc_type))
  end

  test "should destroy proc_type" do
    assert_difference('ProcType.count', -1) do
      delete :destroy, :id => proc_types(:one).to_param
    end

    assert_redirected_to proc_types_path
  end
end
