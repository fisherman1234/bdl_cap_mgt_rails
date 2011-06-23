require 'test_helper'

class MeetingsResultsControllerTest < ActionController::TestCase
  setup do
    @meetings_result = meetings_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meetings_result" do
    assert_difference('MeetingsResult.count') do
      post :create, :meetings_result => @meetings_result.attributes
    end

    assert_redirected_to meetings_result_path(assigns(:meetings_result))
  end

  test "should show meetings_result" do
    get :show, :id => @meetings_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @meetings_result.to_param
    assert_response :success
  end

  test "should update meetings_result" do
    put :update, :id => @meetings_result.to_param, :meetings_result => @meetings_result.attributes
    assert_redirected_to meetings_result_path(assigns(:meetings_result))
  end

  test "should destroy meetings_result" do
    assert_difference('MeetingsResult.count', -1) do
      delete :destroy, :id => @meetings_result.to_param
    end

    assert_redirected_to meetings_results_path
  end
end
