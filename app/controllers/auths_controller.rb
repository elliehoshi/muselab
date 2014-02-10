class AuthsController < ApplicationController

	# before_action :authenticate_user, only: [:destroy]

	def new
		if current_user
			redirect_to ideas_path
			flash[:notice] = "already logged in ya bishh"
		else
			@user = User.new
		end
	end

	def create
		if !(User.where(username: params[:user][:username]).empty?)
			@user = User.find_by(username: params[:user][:username])
			if @user.authenticated?(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to ideas_path
			else
				flash.now[:error] = "no. try again"
				render :new
			end
		else
			@user = User.new(username: params[:user][:username])
			flash.now[:error] = "try again"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to ideas_path
	end
end