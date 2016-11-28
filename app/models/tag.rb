# tag.rb
# refer to post.rb for comments

class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :slug, type: String
  field :name, type: String

  # this model should be saved in Post Document
  embedded_in :post

  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true

  index({ slug: 1 }, { unique: true, name: "slug_index" }) 
end
