class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_post, only: %i[edit update destroy]
  def index
    # N+1問題解決
    @posts = Post.where(status: "publish").includes(:tags).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    url = params[:post][:youtube_id]
    youtubeID = url.last(11)
    @post.youtube_id = youtubeID
    tag_list = params[:post][:tagname].split(',') 
    
    if @post.title.blank?
      set_youtube_api_key_and_get_response
      set_youtube_object_title
    end

    if @post.body.blank? 
      set_youtube_api_key_and_get_response
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
    @comment = @post.comments.new
    @comments = @post.comments.all
  end

  def edit
    @edit_tag_list = @post.tags.pluck(:tagname).join(",")
  end

  def update
    tag_list = params[:post][:tagname].split(',') 
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to posts_path, success: '更新しました'
    else
      flash.now[:danger] = '更新失敗しました'
      render :edit
    end
  end

  def destroy 
    @post.delete
    redirect_to posts_path, danger: '投稿を削除しました'
  end

  def search
    search_form = SearchForm.new(search_params)
    # 配列にはpageメソッドが使えないため
    @posts = Kaminari.paginate_array(search_form.search).page(params[:page])
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
  
  def search_params
    params.fetch(:search, {}).permit(:word)
  end

  def set_youtube_api_key_and_get_response
    @youtube = Google::Apis::YoutubeV3::YouTubeService.new
    @youtube.key = Rails.application.credentials.google[:api_key]
    options = {
      # urlのラスト11字
      id: @post.youtube_id
    }
    @response = @youtube.list_videos("snippet", options)
  end
  
  def set_youtube_object_title
    @post.title = @response.items[0].snippet.title
  end
  
  def set_youtube_object_body
    @post.body = @response.items[0].snippet.description
  end
  
  def set_post
    @post = current_user.posts.find(params[:id])
  end
end