require 'test_helper'

class ProjectIdeasControllerTest < ActionController::TestCase
  setup do
    @project_idea = project_ideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_idea" do
    assert_difference('ProjectIdea.count') do
      post :create, project_idea: { idea_id: @project_idea.idea_id, project_id: @project_idea.project_id }
    end

    assert_redirected_to project_idea_path(assigns(:project_idea))
  end

  test "should show project_idea" do
    get :show, id: @project_idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_idea
    assert_response :success
  end

  test "should update project_idea" do
    patch :update, id: @project_idea, project_idea: { idea_id: @project_idea.idea_id, project_id: @project_idea.project_id }
    assert_redirected_to project_idea_path(assigns(:project_idea))
  end

  test "should destroy project_idea" do
    assert_difference('ProjectIdea.count', -1) do
      delete :destroy, id: @project_idea
    end

    assert_redirected_to project_ideas_path
  end
end
