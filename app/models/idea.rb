class Idea < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	has_many :keywords, class_name: "IdeaKeywords", :foreign_key => "idea_id"
end
