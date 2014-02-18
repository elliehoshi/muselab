class IdeasController < ApplicationController
	
	def index
		if params[:stuff] == nil
	      @ideas = Idea.all
	    elsif params[:stuff] == "web"
	      @ideas = Category.find_by(name: "Web").ideas
	    elsif params[:stuff] == "design"
	      @ideas = Category.find_by(name: "Design").ideas
	    elsif params[:stuff] == "tech"
	      @ideas = Category.find_by(name: "Tech").ideas
	    elsif params[:stuff] == "app"
	      @ideas = Category.find_by(name: "App").ideas
	    elsif params[:stuff] == "gaming"
	      @ideas = Category.find_by(name: "Gaming").ideas
	    elsif params[:stuff] == "ecommerce"
	      @ideas = Category.find_by(name: "eCommerce").ideas
	    elsif params[:stuff] == "myideas"
	      @ideas = current_user.ideas
	    end

	    @stuff = params[:stuff]
  end

	def new
		if current_user
			@idea = current_user.ideas.new
		end
	end

	def show
		@idea = Idea.where(id: params[:id]).first
	end

	def edit
		@idea = Idea.where(id: params[:id]).first
	end

	def update
		@idea = Idea.where(id: params[:id]).first

		if @idea.update(params[:idea].permit(:title, :category, :blurb, :tag))
		redirect_to @idea
		else
			render 'edit'
		end
	end	

	def create
			@idea = current_user.ideas.create(idea_params)
			redirect_to ideas_path
	end

	def destroy
		if current_user
			@idea = current_user.ideas.find(params[:id]).destroy
			redirect_to ideas_path
		end
	end


	# def upvote
	# 	@idea = Idea.find(params[:id])
	# 	@idea.upvotes = @idea.upvotes + 1
	# 	@idea.save
	# 	redirect_to ideas_path
	# end

	def welcome
		@categories = Category.all
	end

	private
    def idea_params
      params.require(:idea).permit(:title, :category_id, :blurb, :tag, :created, :is_favorited)
    end

end