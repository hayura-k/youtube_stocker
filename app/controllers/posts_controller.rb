class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_post, only: %i[edit update destroy]
  def index
    # N+1問題解決
    @posts = Post.where(status: "publish").includes(:tags,:user).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tagname].split(',') 
    url = params[:post][:youtube_id]
    # youtube動画のタイトルと本文を自動取得
    youtube_id = url.last(11)
    @post.youtube_id = youtube_id
    attach_youtube_object_attributes

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
    @comments = @post.comments.includes(:user)
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

  def attach_youtube_object_attributes
    @youtube = Google::Apis::YoutubeV3::YouTubeService.new
    @youtube.key = Rails.application.credentials.google[:api_key]
    options = {
      # urlのラスト11字
      id: @post.youtube_id
    }
    @response = @youtube.list_videos("snippet", options)
    @post.title = @response.items[0].snippet.title　 if @post.title.blank?
    @post.body = @response.items[0].snippet.description　if @post.body.blank?
  end
  
  def set_post
    @post = current_user.posts.find(params[:id])
  end
end