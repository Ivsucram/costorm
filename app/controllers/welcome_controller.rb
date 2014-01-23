class WelcomeController < ApplicationController
  # GET /
  def index
    @user = User.new
  end

  # POST /
  def signup
    @user = User.new(new_user_params)
    @user.term_date = Date.today
    @user.confirmed_account = false

    respond_to do |format|
      if @user.save
        format.html { redirect_to index, notice: 'User was successfully created.' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  # POST /
  def signin
  end

  private

  def new_user_params
  	params.require(:user).permit(:name, :nick, :email, :password, :term_flag, :birthday)
  end
end
