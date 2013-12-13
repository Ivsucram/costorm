class CreateProjectIdeas < ActiveRecord::Migration
  def change
    create_table :project_ideas do |t|
      t.integer :idea_id
      t.integer :project_id

      t.timestamps
    end
  end
end
