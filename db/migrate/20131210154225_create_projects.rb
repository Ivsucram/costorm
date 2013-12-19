class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :project_type
      t.boolean :is_published_flag
      t.datetime :published_date

      t.timestamps
    end
  end
end
