class CreateIdeaPoints < ActiveRecord::Migration
  def change
    create_table :idea_points do |t|
      t.integer :idea_id
      t.integer :user_id
      t.boolean :vote

      t.timestamps
    end
  end
end
