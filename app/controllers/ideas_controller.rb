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

	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :category, :blurb, :tag)
    end

end