class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]
  
  def new
  end
  
  def create
    @user = login(params[:session][:email], params[:session][:password])
    if @user
      redirect_to new_user_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to login_path, success: 'ログアウトしました'
  end
  
end
