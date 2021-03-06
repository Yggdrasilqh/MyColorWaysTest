class TeamsController < ApplicationController
  def new; end

  def create
    Team.transaction do
      current_user = User.find session[:current_user_id]
      team = current_user.teams.build(team_params)
      if current_user.save
        session[:current_team_id] = team.id
        redirect_to team
      end
    end
  end

  def index
    cur_user = User.find session[:current_user_id]
    session[:current_team_name] = nil
    session[:current_team_id] = nil
    @teams = cur_user.teams unless cur_user.user_teams.nil?
  end

  def destroy
    team = Team.find params[:id]
    team.destroy!
    redirect_to teams_path
  end

  def show
    session[:current_project_name] = nil
    session[:current_project_id] = nil
    session[:current_team_id] = params[:id]
    session[:current_team_name] = (Team.find params[:id]).name
    @cur_team = Team.find session[:current_team_id]
    accesses = Access.joins(:project).where('accesses.user_id' =>
                                                session[:current_user_id],
                                            'projects.team_id' =>
                                                session[:current_team_id])
    @projects = Project.find accesses.pluck(:project_id)

  end

  private

  def team_params
    params.require(:team).permit(:name, :describe)
  end



end
