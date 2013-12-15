class WelcomeController < ApplicationController
  def index
  	@user = User.new
    @success
    @error
  end

  def new_user
    if :password.equal :confirmPassword
    	@user = User.new(user_params)

    	respond_to do |format|
        if @user.save
          format.html { redirect_to index, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
        end
      end
    end
  end

  def user_params
  	params.require(:user).permit(:name, :nick, :email, :password, :termflag, :birthday)
  end
end
