class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nick
      t.string :email
      t.string :password
      t.string :company
      t.boolean :termflag
      t.boolean :confirmedAccount
      t.datetime :termDate
      t.date :birthday

      t.timestamps
    end
  end
end
