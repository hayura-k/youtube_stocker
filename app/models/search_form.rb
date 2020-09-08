class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :word, :string

  def search
    if Post.title_contain(word).present?
      return Post.title_contain(word)
    elsif Tag.tagname_contain(word).present?
      tags = Tag.tagname_contain(word)
      posts = []
      tags.each do |tag|
        posts << tag.posts
      end
      return posts.flatten
    else 
      return Post.where(status: "publish")
    end
  end
  
end