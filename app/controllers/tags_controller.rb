class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts
    @youtube = Google::Apis::YoutubeV3::YouTubeService.new
    @youtube.key = Rails.application.credentials.google[:api_key]
  end
end
