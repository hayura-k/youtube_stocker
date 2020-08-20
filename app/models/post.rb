class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations

  validates :youtube_url, presence: true, uniqueness: true 

  def save_tag(sent_tags)
    # pluck(:カラム名)で値を配列で取得する
    current_tags = self.tags.pluck(:tagname) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    # 新しくタグの作成時に使用する変数
    new_tags = sent_tags - current_tags
    
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tagname: old)
    end

    new_tags.each do |new|
      # 新規のタグを追加
      new_post_tag = Tag.find_or_create_by(tagname: new)
      self.tags << new_post_tag
    end
  end
  
end