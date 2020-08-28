class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy guest_login]
  
  def new
  end
  
  def create
    @user = login(params[:session][:email], params[:session][:password])
    if @user
      redirect_to posts_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました'
  end
  
  def guest_login
    guest_user = User.find_by!(role: 'guest_user')
    auto_login(guest_user)
    redirect_to posts_path, success: 'ゲストユーザーでログインしました'
  end
  
end
