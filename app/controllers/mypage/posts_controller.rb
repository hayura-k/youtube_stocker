class Mypage::PostsController < ApplicationController
  def index
    @posts = current_user.posts.includes(:tags,:post_tag_relations).page(params[:page])
  end
end
