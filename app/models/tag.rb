class Tag
  include Mongoid::Document
  field :tag_name, type: String
  has_and_belongs_to_many :ideas
end
