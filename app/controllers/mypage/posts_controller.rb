class Mypage::PostsController < ApplicationController
  def index
    @posts = current_user.posts.page(params[:page])
  end
end
