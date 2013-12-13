class WelcomeController < ApplicationController
  def index
  	@user = User.new
  end

  def newUser
  	@user = User.new(user_params)

  	respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
  	params.require(:user).permit(:name, :nick, :email, :password, :termflag, :birthday)
  end
end
