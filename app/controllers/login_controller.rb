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

  def log_out
    session.clear
    redirect_to root_path
  end
end
