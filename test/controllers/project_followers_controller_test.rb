require 'test_helper'

class ProjectFollowersControllerTest < ActionController::TestCase
  setup do
    @project_follower = project_followers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_followers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_follower" do
    assert_difference('ProjectFollower.count') do
      post :create, project_follower: { project_id: @project_follower.project_id, user_id: @project_follower.user_id }
    end

    assert_redirected_to project_follower_path(assigns(:project_follower))
  end

  test "should show project_follower" do
    get :show, id: @project_follower
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_follower
    assert_response :success
  end

  test "should update project_follower" do
    patch :update, id: @project_follower, project_follower: { project_id: @project_follower.project_id, user_id: @project_follower.user_id }
    assert_redirected_to project_follower_path(assigns(:project_follower))
  end

  test "should destroy project_follower" do
    assert_difference('ProjectFollower.count', -1) do
      delete :destroy, id: @project_follower
    end

    assert_redirected_to project_followers_path
  end
end
