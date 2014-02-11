class Comment
	include Mongoid::Document
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user

  commentable = Idea.find(1)
	comments = commentable.comments.recent.limit(10).all

  commentable = Idea.create
	comment = commentable.comments.create
	comment.title = "First comment."
	comment.comment = "This is the first comment."
	comment.save

  belongs_to :user
end
