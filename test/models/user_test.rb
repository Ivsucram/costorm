require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  # assert true
  # end
  setup do
  	@user = users(:good_one)
  end

  # CRUD C
  test 'should create' do
  	assert_difference('User.count') do
  		user = User.create(:name => 'MyNameTest', :nick => 'MyNickTest', :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  		assert(user.email == 'myemailtest@email.com', 'User.create was expected to downcase email')
  	end 	
  end

  # CRUD R
  test 'should read' do
  	assert(User.first == @user, 'User.first expected to be good_one from yaml')
  	user = User.create(:name => 'MyNameTest2', :nick => 'MyNickTest2', :email => 'MyEmailTest2@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(User.last == user, 'User.last expected to be %{user}')
  end

  # CRUD U
  test 'should update' do
  	user = User.create(:name => 'MyNameTest3', :nick => 'MyNickTest3', :email => 'MyEmailTest3@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user.name == 'MyNameTest3')
  	user.name = 'MyNameTest4'
  	user.save
  	assert(user.changed? == false, 'user was not saved')
  	assert(user.name == 'MyNameTest4')
  end

  # CRUD D
  test 'should delete' do
  	assert_difference('User.count', -1) do
  		User.first.delete
  	end
  end

  test 'validates field name' do
  	user_count = User.all.count
  	
  	# Validates presence
  	User.create(:nick => 'MyNickTest', :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user_count == User.all.count, 'Should not create user')

  	# Validates length
  	User.create(:name => '123456789012345678901234567890123456789012345678901', :nick => 'MyNickTest', :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
	assert(user_count == User.all.count, 'Should not create user')  	
	assert_difference('User.count') do
		User.create(:name => '12345678901234567890123456789012345678901234567890', :nick => 'MyNickTest', :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
	end
  end  

  test 'validates field nick' do
  	user = nil
  	# Validates allow_nil
  	assert_difference('User.count') do
  		user = User.create(:name => 'MyNameTest', :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	end
  	assert_difference('User.count') do
  		User.create(:name => 'MyNameTest', :email => 'MyEmailTest2@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	end

  	# Validates uniqueness
  	user_count = User.all.count
  	User.create(:name => 'MyNameTest', :nick => User.first.nick, :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user_count == User.all.count, 'Should not create user')

  	# Validates lenght
  	User.create(:name => 'MyNameTest', :nick => '12345678901234567', :email => 'MyEmailTest@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user_count == User.all.count, 'Should not create user')
  	assert_difference('User.count') do
  		User.create(:name => 'MyNameTest', :nick => '1234567890123456', :email => 'MyEmailTest3@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	end
  end

  test 'validates field email' do
  	user_count = User.all.count

  	# Validates presence
  	User.create(:name => 'MyNameTest', :nick => 'MyNickTest', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user_count == User.all.count, 'Should not create user')

  	# Validates uniqueness
	User.create(:name => 'MyNameTest', :nick => 'MyNickTest', :email => User.first.email, :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user_count == User.all.count, 'Should not create user')

  	# Validates length
  	# Validates lenght
  	User.create(:name => 'MyNameTest', :nick => 'MyNickTest', :email => '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	assert(user_count == User.all.count, 'Should not create user')
  	assert_difference('User.count') do
  		User.create(:name => 'MyNameTest', :nick => 'MyNickTest', :email => '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890@email.com', :password => 'zxcasdqwe', :term_flag => true, :confirmed_account => false, :term_date => Date.today, :birthday => Date.today-100)
  	end	
  end
end