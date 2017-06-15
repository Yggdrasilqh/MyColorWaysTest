class TodosController < ApplicationController

  def new
    @users = Access.joins(:user)
                 .where('accesses.project_id' => session[:current_project_id])
                 .pluck('users.name', 'users.id')
    p @users
  end

  def create
    @todo = Todo.new todo_params
    @todo.project_id = session[:current_project_id]
    @todo.status = 0
    @todo.save!
    redirect_to project_path session[:current_project_id]
  end

  def do
    todo = Todo.find(params[:id])
    todo.status = 1
    todo.save!
    redirect_to project_path session[:current_project_id]
  end

  def undo
    todo = Todo.find(params[:id])
    todo.status = 0
    todo.save!
    redirect_to project_path session[:current_project_id]
  end


  private

  def todo_params
    params.require(:todo).permit(:name, :user_id)
  end
end
