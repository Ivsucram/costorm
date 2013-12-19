class Keyword < ActiveRecord::Base
	has_many :idea_keywords
	has_many :ideas, class_name: "Idea", through: :idea_keywords, :source => :idea, :foreign_key => "keyword_id"

	validates :name,
      			presence: true,
      			length: { maximum: 100, too_long: "Maximum is %{count} characters" },
      			format: { with: /\A[a-z0-9_-]{2,100}\Z/i, message: 'It not a valid name' },
      			uniqueness: true
end
