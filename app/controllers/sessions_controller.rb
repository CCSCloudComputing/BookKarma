class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by_email(params[:email])
	
	if user && user.authenticate(params[:password])
		cookies[:auth_token] = user.auth_token
		flash[:success] = "Successfully logged in!"
		redirect_to root_url
	else
		flash.now[:error] = "Invalid email or password"
		render :new
	end
end

def destroy
	cookies.delete(:auth_token)
	redirect_to login_path
end

end
