class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller? #デバイスコントローラーの処理がtrueの場合

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'qwerty' && password == '2222'
    end

    def configure_permitted_parameters  # メソッド名は慣習
      # deviseのUserモデルにパラメーターを許可
      devise_parameter_sanitizer.permit(:sign_up, keys: [:許可するキー])
    end







  end


end
