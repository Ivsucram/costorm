require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'should create user' do
  	assert_difference('User.count') do
  		post :signup, user: {name: 'nametest', nick: 'nicktest', email: 'test@gmail.com', email_password: 'test@gmail.com', password: 'zxcasdqwe', password_confirmation: 'zxcasdqwe', term_flag: true, birthday: Date.today-1 }  		
  	end

  	assert_redirected_to '/'
  end

  test 'should login user' do

  	post :signin, user: {email: users(:good_one).email, password: users(:good_one).password}
  	assert_redirected_to main_desktop_path
  end

end
