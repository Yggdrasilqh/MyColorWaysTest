class LoginController < ApplicationController
  def index; end

  def create
    username = params[:user][:name]
    if(user = User.aut username)
      session[:current_user_id] = user.id
      session[:current_user_name] = user.name
      redirect_to teams_path
    end

  end

  # 用存在 Session 的 :current_user_id 來找到 User。
  # 這是 Rails 常見處理使用者登入的手法；
  # 登入時將使用者的 ID 存在 Session，登出時再清掉。
  def self.current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def log_out
    session.clear
    redirect_to root_path
  end
end
