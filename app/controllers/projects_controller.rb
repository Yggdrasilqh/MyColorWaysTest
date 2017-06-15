#
class ProjectsController < ApplicationController
  def new;
  end

  def create
    cur_user = User.find session[:current_user_id]
    @cur_team = Team.find session[:current_team_id]
    new_project = Project.new project_params
    new_project.team = @cur_team
    cur_user.projects << new_project
    cur_user.save!
    p @cur_team
    redirect_to team_path(@cur_team)
  end

  def show
    @project = Project.find(params[:id])
    session[:current_project_id] = params[:id]
    session[:current_project_name] = @project.name
    cur_team = Team.find session[:current_team_id]
    @members = cur_team.users.pluck :name, :id
  end


  private

  def project_params
    params.require(:project).permit(:name, :describe)
  end
end
