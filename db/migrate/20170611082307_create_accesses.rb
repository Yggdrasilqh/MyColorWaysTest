class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.string :access
      t.belongs_to :user
      t.belongs_to :team
      t.belongs_to :project
      t.timestamps
    end
  end
end
