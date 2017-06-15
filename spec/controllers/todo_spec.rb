require 'rails_helper'
# require 'spec_test_helper'
RSpec.describe TodosController, type: :controller do
  # include SpecHelper

  before do
    # @current_user = User.find session[:current_user_id]
    # @current_team = Team.find session[:current_team_id]
    # @current_project = Project.find session[:current_project_id]
  end


  it 'should be put to terminal' do
    get 'create'
    expect(response).to render_template('create')
  end
end
