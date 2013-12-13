require 'test_helper'

class IdeaKeywordsControllerTest < ActionController::TestCase
  setup do
    @idea_keyword = idea_keywords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idea_keywords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea_keyword" do
    assert_difference('IdeaKeyword.count') do
      post :create, idea_keyword: { idea_id: @idea_keyword.idea_id, keyword_id: @idea_keyword.keyword_id }
    end

    assert_redirected_to idea_keyword_path(assigns(:idea_keyword))
  end

  test "should show idea_keyword" do
    get :show, id: @idea_keyword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea_keyword
    assert_response :success
  end

  test "should update idea_keyword" do
    patch :update, id: @idea_keyword, idea_keyword: { idea_id: @idea_keyword.idea_id, keyword_id: @idea_keyword.keyword_id }
    assert_redirected_to idea_keyword_path(assigns(:idea_keyword))
  end

  test "should destroy idea_keyword" do
    assert_difference('IdeaKeyword.count', -1) do
      delete :destroy, id: @idea_keyword
    end

    assert_redirected_to idea_keywords_path
  end
end
