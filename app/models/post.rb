class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations

  validates :youtube_url, presence: true, uniqueness: true 
end
