class IdeaPoint < ActiveRecord::Base
	belongs_to :user
	belongs_to :idea

	validates :idea_id,
      			presence: true
    validates :user_id,
      			presence: true
    validates :vote,
      			presence: true,
      			uniqueness: { scope: [:idea_id, :user_id] },
      			inclusion: { in: [true, false] }
end
