class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :content
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
  end
end
