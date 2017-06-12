#
class UserTeamsController < ApplicationController
  def create
    @cur_team = Team.find session[:current_team_id]
    new_member = User.aut params[:user][:name]
    user_team = UserTeam.new user: new_member, team_id: @cur_team.id
    @notice = '添加失败'
    if new_member && new_member.id != session[:current_user_id]
      @notice = '添加成功' if user_team.save
    end
    render 'teams/show'
  end
end
