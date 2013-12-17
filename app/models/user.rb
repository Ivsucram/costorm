class User < ActiveRecord::Base
	has_many :projects
	has_many :ideas

	has_many :project_followers
	has_many :projects_followed, class_name: "Project", through: :project_followers, :source => :project, :foreign_key => "user_id"

	has_and_belongs_to_many :followers, class_name: "User", :join_table => "user_followers", :foreign_key => "following_id", :association_foreign_key => "follower_id"
end
