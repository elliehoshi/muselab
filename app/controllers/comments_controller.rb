class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.find
	end

end 