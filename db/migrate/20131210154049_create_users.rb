class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nick
      t.string :email
      t.string :password
      t.string :company
      t.boolean :termflag
      t.boolean :confirmed_account
      t.datetime :term_date
      t.date :birthday

      t.timestamps
    end

    create_table :user_followers, :id => false do |t|
      t.integer :following_id
      t.integer :follower_id
    end

    create_table :user_following, :id => false do |t|
      t.integer :follower_id
      t.integer :following_id
    end
  end
end
