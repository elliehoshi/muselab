class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end


	def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "You successfully saved your runner."
            redirect_to ideas_path
        else
            render action: 'new'
        end
    end

	# def create
	# 	User.create(params[:user].permit(:username, :password))
	# 	if @user.authenticated?(params[:user][:password])
	# 		session[:user_id	] = user.id
	# 	redirect_to ideas_path
	# 	end
	# end

	def show
		# @user = User.find(params[:id])
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit(:user, :username, :password)
	end

end