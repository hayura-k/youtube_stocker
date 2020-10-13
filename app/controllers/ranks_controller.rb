class RanksController < ApplicationController
  def index
    @top_rank_posts = Post.joins(:likes).group(:id).order('count(likes.post_id) desc').limit(3)
  end
end
