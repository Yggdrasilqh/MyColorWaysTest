class User < ApplicationRecord
  has_many :comments,    dependent: :destroy, foreign_key: :user_id
  has_many :user_teams,  dependent: :destroy, foreign_key: :user_id
  has_many :teams,       through: :user_teams
  has_many :projects,    through: :accesses
  has_many :todos

  def self.aut(name)
    user = find_by_name name
    return user if user
  end


end
