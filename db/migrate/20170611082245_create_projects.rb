class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :describe
      t.boolean :status
      t.belongs_to :team
      t.timestamps
    end
  end
end
