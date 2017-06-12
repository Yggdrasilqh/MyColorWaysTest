class Team < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  has_many :accesses, dependent: :destroy
  has_many :projects, through: :accesses



end
