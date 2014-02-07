class SessionsController < ApplicationController
		def new
		end

		def create
		end

		def destory
			session[:user_id] = nil
			redirect_to new_auth_url
			notice: "idk ur logged out?"
		end
end