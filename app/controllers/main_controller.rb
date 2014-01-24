class MainController < ApplicationController
	# GET /
	def index
		online_redirect
	end

	# GET /
	def signout
		cookies.delete :email
		redirect_to '/'
	end

	private

	def online_redirect
		if cookies[:email]
			@user = User.find_by(email: cookies[:email])
		else
			redirect_to '/'
		end
	end

end
