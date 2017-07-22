class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
# 追加した フィールドを許可する strong parameters の設定(1)
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_request_from

  protected

 # 追加した フィールドを許可する strong parameters の設定(2)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :address])
  end

  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
  # 現在のURLを保存しておく
  session[:request_from] = request.original_url
  end

  def return_back
    if request.referer
      redirect_to :back and return true
    elsif @request_from
      redirect_to @request_from and return true
    end
  end
end