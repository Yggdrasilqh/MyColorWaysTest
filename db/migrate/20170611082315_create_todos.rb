class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :project
      t.integer :status
      t.date :deadline
      t.timestamps
    end
  end
end
