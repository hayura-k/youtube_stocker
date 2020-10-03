class TagsController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.where(status: 'publish').includes(:tags, :user)
  end
end
