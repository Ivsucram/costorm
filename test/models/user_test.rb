require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  # assert true
  # end
  setup do
  	@user = users(:good_one)
  end

  test 'should create' do
  	assert_difference('User.count') do
  		user = User.create(:name => 'MyNameTest', :nick => 'MyNickTest', :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  		assert(user.email == 'myemailtest@email.com', 'User.create was expected to downcase email')
  	end 	
  end

  test 'should read' do
  	assert(User.first == @user, 'User.first expected to be good_one from yaml')
  	user = User.create(:name => 'MyNameTest2', :nick => 'MyNickTest2', :email => 'MyEmailTest2@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(User.last == user, 'User.last expected to be %{user}')
  end

  test 'should update' do
  	user = User.create(:name => 'MyNameTest3', :nick => 'MyNickTest3', :email => 'MyEmailTest3@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user.name == 'MyNameTest3')
  	user.name = 'MyNickTest4'
  	user.save
  	assert(user.changed? == false, 'user was not saved')
  	assert(user.name == 'MyNickTest4')
  end

  test 'should delete' do
  	assert_difference('User.count', -1) do
  		User.first.delete
  	end
  end
end