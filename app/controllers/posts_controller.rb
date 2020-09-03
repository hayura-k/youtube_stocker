class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  def index
    @posts = Post.where(status: "publish").page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    tag_list = params[:post][:tagname].split(',') 
    
    if @post.title.blank?
      set_youtube_api_key
      set_youtube_object_title
    end

    if @post.body.blank? 
      set_youtube_api_key
      set_youtube_object_body
    end

    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path, success: '動画を保存しました'
    else
      render :new
    end
  end
  

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags 
    set_youtube_api_key
    @comment = @post.comments.new
    @comments = @post.comments.all
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, success: '更新しました'
    else
      flash.now[:danger] = '更新失敗しました'
      render :edit
    end
  end

  def destroy 
    @post = current_user.posts.find(params[:id])
    @post.delete
    redirect_to posts_path
  end

  def search
    @posts = Post.post_title_search(params[:title]).page(params[:page])
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
  
  # メソッド名を修正しないといけない
  def set_youtube_api_key
    @youtube = Google::Apis::YoutubeV3::YouTubeService.new
    @youtube.key = Rails.application.credentials.google[:api_key]
    options = {
      # urlのラスト11字
      id: @post.youtube_url
    }
    @response = @youtube.list_videos("snippet", options)
  end
  
  def set_youtube_object_title
    @post.title = @response.items[0].snippet.title
  end
  
  def set_youtube_object_body
    @post.body = @response.items[0].snippet.description
  end
  
end