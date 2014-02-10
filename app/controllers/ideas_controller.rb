class IdeasController < ApplicationController
	
	def index
		if params[:stuff] == nil
	      @ideas = Idea.all
	    elsif params[:stuff] == "web"
	      @ideas = Category.find_by(name: "Web").ideas
	    elsif params[:stuff] == "design"
	      @ideas = Category.find_by(name: "Design").ideas
	    end

	    @stuff = params[:stuff]
  end

	# def index
	# 	@ideas = Idea.all
	# end

	def new
		if current_user
			@idea = current_user.ideas.new
		end
	end

	def show
		@idea = Idea.find(params[:id])
	end

	def edit
		@idea = Idea.find(params[:id])
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
			@idea = current_user.ideas.create(idea_params)
			# Idea.create(params[:idea].permit(:title, :category, :blurb, :tag))
			redirect_to ideas_path
	end

	def destroy
		if current_user
			@idea = current_user.ideas.find(params[:id]).destroy
			# @idea = Idea.find(params[:id]).destroy
			redirect_to ideas_path
		end
	end

	# def destroy
	# 	@idea = Idea.find(params[:id]).destroy
	# 	redirect_to ideas_path
	# end


	private
    def idea_params
      params.require(:idea).permit(:title, :category_id, :blurb, :tag)
    end

end