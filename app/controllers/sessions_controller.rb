class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    Rails.logger.debug(auth.inspect)

    user = User.find_or_create_by(github_id: auth.uid)

    session[:user_id] = user.id
    session[:github_info] = auth.info.slice(:nickname, :image)

    redirect_to root_path, notice: 'ログインしました'
  rescue => e
    Rails.logger.error("GitHub OAuth Error: #{e.message}")
    redirect_to root_path, alert: 'ログインに失敗しました'
  end
end
