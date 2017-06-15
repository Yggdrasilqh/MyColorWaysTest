class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true
  has_many :comments

end
