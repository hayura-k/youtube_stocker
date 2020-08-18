class Post < ApplicationRecord
  belongs_to :user

  validates :youtube_url, presence: true, uniqueness: true 
end
