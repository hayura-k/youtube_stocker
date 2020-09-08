class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :comments, dependent: :destroy

  validates :youtube_url, presence: true, uniqueness: true

  enum status: { unpublish: 0, publish: 1 }

  def save_tag(sent_tags_name)
    # pluck(:カラム名)で値を配列で取得する
    current_tags = self.tags.pluck(:tagname) unless self.tags.nil?
    old_tags = current_tags - sent_tags_name
    # 新しくタグの作成時に使用する変数
    new_tags = sent_tags_name - current_tags
    
    old_tags.each do |old_name|
      self.tags.delete(Tag.find_by(tagname: old_name))
    end

    new_tags.each do |new_name|
      # 新規のタグを追加
      new_post_tag = Tag.find_or_create_by(tagname: new_name)
      self.tags << new_post_tag
    end
  end

  scope :title_contain, -> (word){ where('title LIKE ?', "%#{word}%") }

end