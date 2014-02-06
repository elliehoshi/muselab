class Idea
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
  # field :category, type: String
  field :blurb, type: String
  field :tag, type: String
  belongs_to :category
  belongs_to :user
  has_many :tags
end
