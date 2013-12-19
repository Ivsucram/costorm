class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
