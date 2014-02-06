class AuthsController < ApplicationController

	before_action :authenticate_user, only: [:destroy]

	def new
		if current_user
			redirect_to ideas_path
		else
			@user = User.new
		end
	end

	def create
		user = User.find_by(username: params[:user][:username])
		if user.authenticated?(params[:user][:password])
			session[:user_id] = user.id
			redirect_to ideas_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to auths_new_path
	end
end