class Idea
  include Mongoid::Document
  field :name, type: String
  field :title, type: String
  field :category, type: String
  field :blurb, type: String
  field :tag, type: String
end
