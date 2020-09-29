class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger 

  # エラーページ表示
  unless Rails.env.development?
    rescue_from Exception,                      with: :error500
    rescue_from ActiveRecord::RecordNotFound,   with: :error404
    rescue_from ActionController::RoutingError, with: :error404
  end
  
  private

  def not_authenticated
    redirect_to login_path, warning: 'ログインしてください'
  end

  def error404(_e)
    render 'errors/error404', status: :not_found, format: [:html]
  end
  
  def error500(e)
    # エラー原因表示
    logger.error [e, *e.backtrace].join('¥n')
    render 'errors/error500', status: :internal_server_error, format: [:html]
  end
end
