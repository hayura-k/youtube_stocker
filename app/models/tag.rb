class Tag < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy
  has_many :posts, through: :post_tag_relations

  validates :tagname, presence: true, uniqueness: true

  scope :tagname_contain, -> (word){ where('tagname LIKE ?',"%#{word}%") }
end
