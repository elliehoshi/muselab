class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new
	end

	def create
		User.create(params[:user].permit(:username, :password))
		if user.authenticated?(params[:user][:password])
			session[:user_id] = user.id
		redirect_to ideas_path
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
	end

end