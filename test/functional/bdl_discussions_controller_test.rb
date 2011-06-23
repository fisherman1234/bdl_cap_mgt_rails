require 'test_helper'

class BdlDiscussionsControllerTest < ActionController::TestCase
  setup do
    @bdl_discussion = bdl_discussions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bdl_discussions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bdl_discussion" do
    assert_difference('BdlDiscussion.count') do
      post :create, :bdl_discussion => @bdl_discussion.attributes
    end

    assert_redirected_to bdl_discussion_path(assigns(:bdl_discussion))
  end

  test "should show bdl_discussion" do
    get :show, :id => @bdl_discussion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bdl_discussion.to_param
    assert_response :success
  end

  test "should update bdl_discussion" do
    put :update, :id => @bdl_discussion.to_param, :bdl_discussion => @bdl_discussion.attributes
    assert_redirected_to bdl_discussion_path(assigns(:bdl_discussion))
  end

  test "should destroy bdl_discussion" do
    assert_difference('BdlDiscussion.count', -1) do
      delete :destroy, :id => @bdl_discussion.to_param
    end

    assert_redirected_to bdl_discussions_path
  end
end
