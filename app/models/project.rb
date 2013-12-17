class Project < ActiveRecord::Base
	belongs_to :user
	has_many :ideas, dependent: :destroy

	has_many :project_followers
	has_many :followers, class_name: "User", through: :project_followers, :source => :user, :foreign_key => "project_id"
end
