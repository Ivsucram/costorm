class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :author_id
      t.string :name
      t.string :description
      t.integer :projectType
      t.boolean :isPublishedFlag
      t.datetime :publishedDate
      t.datetime :createdDate
      t.datetime :lastUpdateDate

      t.timestamps
    end
  end
end
