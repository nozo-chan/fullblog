class UsersController < ApplicationController
	
	def index 
		@users = User.all 
	end 

	def new 
		@user= User.new 
	end 

	def create 
		
		@user= User.new(params_users)

	if @user.save 
		flash[:notice] ="your account was created successfully."
			redirect_to user_path @user
		else 
			flash[:alert] ="there was a problem creating the account"
			redirect_to new_user_path
		end 
	end 

	def show 
	@user = User.find(params[:id])

	end 

	def destroy
		@user = User.find_by_id params[:id]
		if @user and @user.destroy
			flash[:notice]='user destroyed succesfully'
		else 
			flash[:error]='there was a problem deleting the user'
		end 
		redirect_to users_path 
	end 

	def edit 	
		@user = User.find(params[:id])
	end 

	def update 
		@user = User.find(params[:id])
		if @user.update(params_users)
			flash[:notice] = "user data has been updated"
		else 
			flash[:alert] = "sorry something went wrong"
		end 
		redirect_to user_path
	end 

	private

	def params_users
		params.require(:user).permit(:email,:password)
	end 


end 