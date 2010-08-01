require 'test_helper'

class ReceivablesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receivables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receivable" do
    assert_difference('Receivable.count') do
      post :create, :receivable => { }
    end

    assert_redirected_to receivable_path(assigns(:receivable))
  end

  test "should show receivable" do
    get :show, :id => receivables(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => receivables(:one).to_param
    assert_response :success
  end

  test "should update receivable" do
    put :update, :id => receivables(:one).to_param, :receivable => { }
    assert_redirected_to receivable_path(assigns(:receivable))
  end

  test "should destroy receivable" do
    assert_difference('Receivable.count', -1) do
      delete :destroy, :id => receivables(:one).to_param
    end

    assert_redirected_to receivables_path
  end
end
