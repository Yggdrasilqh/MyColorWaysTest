class CreateUserTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :user_teams do |t|
      t.string :access
      t.belongs_to :user
      t.belongs_to :team
      t.timestamps
    end
  end
end
