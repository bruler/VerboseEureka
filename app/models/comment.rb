# comment.rb
# refer to post.rb for comments

class Comments
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: String
  field :email, type: String
  field :website, type: String
  field :content, type: String

  # this model should be saved in Post Document
  embedded_in :post

  validates :author, presence: true
  validates :content, presence: true
end
