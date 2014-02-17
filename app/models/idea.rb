class Idea
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :title, type: String
  field :blurb, type: String
  field :tag, type: String
  field :upvotes, type: Integer
  field :is_favorite, type: Mongoid::Boolean
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :tags

  # has_many :acts_as_commentable

  # validates :title, length: { maximum: 30 } 
end
