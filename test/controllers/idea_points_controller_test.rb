require 'test_helper'

class IdeaPointsControllerTest < ActionController::TestCase
  setup do
    @idea_point = idea_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idea_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea_point" do
    assert_difference('IdeaPoint.count') do
      post :create, idea_point: { idea_id: @idea_point.idea_id, user_id: @idea_point.user_id, vote: @idea_point.vote }
    end

    assert_redirected_to idea_point_path(assigns(:idea_point))
  end

  test "should show idea_point" do
    get :show, id: @idea_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea_point
    assert_response :success
  end

  test "should update idea_point" do
    patch :update, id: @idea_point, idea_point: { idea_id: @idea_point.idea_id, user_id: @idea_point.user_id, vote: @idea_point.vote }
    assert_redirected_to idea_point_path(assigns(:idea_point))
  end

  test "should destroy idea_point" do
    assert_difference('IdeaPoint.count', -1) do
      delete :destroy, id: @idea_point
    end

    assert_redirected_to idea_points_path
  end
end
