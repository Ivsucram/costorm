class IdeaKeyword < ActiveRecord::Base
	belongs_to :idea, class_name: "Idea"
	belongs_to :keyword, class_name: "Keyword"

	validates :idea_id,
      			presence: true
    validates :keyword_id,
      			presence: true,
      			uniqueness: { scope: :idea_id }
end
