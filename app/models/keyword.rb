class Keyword < ActiveRecord::Base
	has_many :idea_keywords
	has_many :ideas, class_name: "Idea", through: :idea_keywords, :source => :idea, :foreign_key => "keyword_id"

#TODO: REGEX for name
	validates :name,
      			presence: true,
      			uniqueness: true,
      			length: { maximum: 100, too_long: "Maximum is %{count} characters" }

    before_save :downcase_name

    private
    
    def downcase_name
    	self.name = self.name.downcase
    end
end
