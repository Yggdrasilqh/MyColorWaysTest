class AccessesController < ApplicationController
  def create
    access = Access.new
    access.user_id = params[:user][:user_id]
    access.project_id = session[:current_project_id]
    access.save!
    redirect_to project_path(session[:current_project_id])
  end
end
