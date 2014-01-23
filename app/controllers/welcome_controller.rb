class WelcomeController < ApplicationController
  # GET /
  def index
    if cookies[:email]
      redirect_to main_desktop_path
    end
    @user = User.new
  end

  # POST /
  def signup
    @user = User.new(new_user_params)
    @user.term_date = Date.today
    @user.confirmed_account = false

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', notice: 'User was successfully created.' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  # POST /
  def signin
    @user = User.new(login_user_params)

    respond_to do |format|
      if User.find_by(email: @user.email, password: @user.password)
        cookies.permanent[:email] = @user.email
        format.html { redirect_to main_desktop_path }
      else
        format.html { render action: 'index' }
      end
    end
  end

  private

  def new_user_params
  	params.require(:user).permit(:name, :nick, :email, :password, :term_flag, :birthday)
  end

  def login_user_params
    params.require(:user).permit(:email, :password)
  end
end
