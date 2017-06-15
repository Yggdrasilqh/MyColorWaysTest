require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'find user' do
    project = Project.find 298486374
    p project
    p project.users
  end
end
