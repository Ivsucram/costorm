require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test 'should get index with logged user' do
    @request.cookies[:email] = users(:good_one).email
    get :index
    assert_response :success
  end

  test 'should get index without logged user' do
    get :index
    assert_redirected_to '/'
  end

end
