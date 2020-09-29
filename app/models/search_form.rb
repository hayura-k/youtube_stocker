class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :word, :string

  def search
    posts = []
    posts << Post.title_contain(word)
    posts << Tag.tagname_contain(word).map(&:posts)
    posts.flatten.uniq.select{|post| post.status == 'publish'}
  end
  
end