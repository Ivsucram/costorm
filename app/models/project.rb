class Project < ActiveRecord::Base
	belongs_to :user
	has_many :ideas, dependent: :destroy

	has_many :project_followers
	has_many :followers, class_name: "User", through: :project_followers, :source => :user, :foreign_key => "project_id"

#TODO: REGEX for name
	validates :user_id, 
                presence: true
    validates :name, 
                presence: true,
                length: { maximum: 100, too_long: 'Maximum is %{count} characters' }
    validates :description, 
                presence: true
    validates :project_type, 
                presence: true,
                numericality: { only_integer: true},
                inclusion: { in: [1, 2], message: "This value is not acceptable" }
    validates :is_published_flag, 
                presence: true
    validates :published_date, 
                presence: false
            
    validate :cannot_be_future_date

    private
    
    def cannot_be_future_date
        errors.add(:published_date, 'cannot be future date') if published_date > Date.today
    end

end
