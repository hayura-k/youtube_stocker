class Mypage::AccountController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to posts_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = 'プロフィール更新失敗しました'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :avatar)
  end
  
end
