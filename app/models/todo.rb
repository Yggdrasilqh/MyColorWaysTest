class Todo < ApplicationRecord
  has_many :comments
  belongs_to :project
  belongs_to :user
end
