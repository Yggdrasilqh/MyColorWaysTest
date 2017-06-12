class Access < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :team
end
