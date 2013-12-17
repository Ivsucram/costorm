class Keyword < ActiveRecord::Base
	has_many :idea_keywords
	has_many :ideas, class_name: "Idea", through: :idea_keywords, :source => :idea, :foreign_key => "keyword_id"
end
