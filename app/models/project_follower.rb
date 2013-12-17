class ProjectFollower < ActiveRecord::Base
	belongs_to :user, class_name: "User"
	belongs_to :project, class_name: "Project"
end
