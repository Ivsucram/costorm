class Idea < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	has_many :idea_keywords
	has_many :keywords, class_name: "Keyword", through: :idea_keywords, :source => :keyword, :foreign_key => "idea_id"
end
