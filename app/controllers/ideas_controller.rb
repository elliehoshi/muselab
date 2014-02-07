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

	def edit
	end

	def update
		@idea = Idea.find(params[:id])

		if @idea.update_attributes(params[:idea].permit(:title, :category, :blurb, :tag))
	redirect_to @idea
		else
			render 'edit'
		end
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