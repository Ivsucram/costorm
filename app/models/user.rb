class User < ActiveRecord::Base
	has_many :projects
	has_many :ideas

	has_many :project_followers
	has_many :followed_projects, class_name: "Project", through: :project_followers, :source => :project, :foreign_key => "user_id"
end
