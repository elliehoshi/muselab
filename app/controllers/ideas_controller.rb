class IdeasController < ApplicationController
	def index
		@ideas = Idea.all
	end

	def new
		@idea = Idea.new
	end

	def show
		@idea = Idea.find(params[:id])
	end

	def create
		Idea.create(params[:idea].permit(:title, :category, :blurb, :tag))
		redirect_to ideas_path
	end

	def destroy
		@idea = Idea.find(params[:id]).destroy
		redirect_to ideas_path
	end

end