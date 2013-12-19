class User < ActiveRecord::Base
	has_many :projects
	has_many :ideas
	has_many :idea_points

	has_many :project_followers
	has_many :projects_followed, class_name: "Project", through: :project_followers, :source => :project, :foreign_key => "user_id"

	has_and_belongs_to_many :followers, class_name: "User", :join_table => "user_followers", :foreign_key => "following_id", :association_foreign_key => "follower_id"
	has_and_belongs_to_many :followings, class_name: "User", :join_table => "user_following", :foreign_key => "follower_id", :association_foreign_key => "following_id"

	def followers=(array)
		array.each do |user|
			user.followings << self
		end
		super
	end

	def followings=(array)
		array.each do |user|
			user.followers << self
		end
	end
end
