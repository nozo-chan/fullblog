class SessionsController < ApplicationController

def new 
	end 

def create 
	@user = User.find_by(email: params[:session][:email])
	puts "==========================="
	puts params[:session][:email]
	puts "==========================="
	if @user && @user.authenticate(params[:session][:password])
		session[:current_user_id] = @user.id
		redirect_to @user
	else 
		flash[:error] ='Invalid email/password!'
		redirect_to login_path
	end 
end 



def destroy 
	session[:current_user_id] = nil
	flash[:notice] = "You've logged out!" 

	redirect_to root_url 
	end 
end 
