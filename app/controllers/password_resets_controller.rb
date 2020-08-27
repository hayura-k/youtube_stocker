class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    # tokenをDBに保存して、その後ユーザーにトークンを付与したメールを送る
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, success: 'パスワード変更のメールを送りました'
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    return not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    # tokenを元にDBからユーザーを取得
    @user = User.load_from_reset_password_token(@token)
    return not_authenticated if @user.blank?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: 'パスワードを変更しました'
    else
      render :edit
    end
  end
end
