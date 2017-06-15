module SpecTestHelper
  def login_ygg
    user = User.new name: 'yggdrasil'
    team = Team.new name: 'ygg_team'
    project = Project.new name: 'ygg_project'
    user.teams << team
    user.projects << project
    session[:current_user_id] = user.id
    session[:current_team_id] = team.id
    session[:current_project_id] = project.id
    user.save!
  end
end