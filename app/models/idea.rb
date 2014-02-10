class Idea
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
  field :blurb, type: String
  field :tag, type: String
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :tags
end
