class Project < ApplicationRecord
  belongs_to :team

  has_many :accesses, dependent: :destroy
  has_many :users, through: :accesses

  has_many :todos, dependent: :destroy
end
