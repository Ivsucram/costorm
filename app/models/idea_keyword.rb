class IdeaKeyword < ActiveRecord::Base
	belongs_to :idea, class_name: "Idea"
	belongs_to :keyword, class_name: "Keyword"
end
