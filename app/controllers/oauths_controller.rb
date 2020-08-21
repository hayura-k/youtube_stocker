class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to posts_path, success: "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to posts_path, success: "#{provider.titleize}でログインしました"
      rescue StandardError
        redirect_to posts_path, danger: "#{provider.titleize}でのログインに失敗しました"
      end
    end
  end
end
