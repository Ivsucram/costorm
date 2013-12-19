class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer :projectType
      t.boolean :isPublishedFlag
      t.datetime :publishedDate

      t.timestamps
    end
  end
end
