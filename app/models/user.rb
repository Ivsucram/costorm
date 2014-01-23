class User < ActiveRecord::Base
	has_many :projects
	has_many :ideas
	has_many :idea_points

	has_many :project_followers
	has_many :projects_followed, class_name: 'Project', through: :project_followers, :source => :project, :foreign_key => 'user_id'

	has_and_belongs_to_many :followers,  class_name: 'User', :join_table => 'user_followers', :foreign_key => 'following_id', :association_foreign_key => 'follower_id'
	has_and_belongs_to_many :followings, class_name: 'User', :join_table => 'user_following', :foreign_key => 'follower_id',  :association_foreign_key => 'following_id'

#TODO: REGEX for name, nick, email, email_confirmation, password, password_confirmation

	validates :name, 
                presence: true,
                length: { maximum: 50, too_long: 'Maximum is %{count} characters' }
#TODO: Make nick unique
    validates :nick, 
                allow_nil: true,
                uniqueness: true,
                length: { maximum: 16, too_long: 'Maximum is %{count} characters' }
    validates :email, 
                presence: true,
                uniqueness: true,
                confirmation: true,
                length: { maximum: 100, too_long: 'Maximum is %{count} characters' }
    validates :email_confirmation,
                length: { maximum: 100, too_long: 'Maximum is %{count} characters' }
    validates :password, 
                presence: true,
                confirmation: true,
                length: { maximum: 50, too_long: 'Maximum is %{count} characters' }
    validates :password_confirmation,
                length: { maximum: 50, too_long: 'Maximum is %{count} characters' }
    validates :company, 
                length: { maximum: 100, too_long: 'Maximum is %{count} characters', message: 'Is not a valid password' },
                allow_nil: true
    validates :term_flag,
                inclusion: { in: [true, false] }
    validates :confirmed_account,
                inclusion: { in: [true, false] }
    validates :term_date, 
                presence: true
    validates :birthday, 
                presence: true

    validate :cannot_be_future_time
    validate :cannot_be_future_date

    after_validation :downcase_email

    private

	def followers=(array)
		array.each do |user|
			user.followings << self
		end
		super
	end

	def followings=(array)
		array.each do |user|
			user.followers << self
		end
	end

    def cannot_be_future_time
        errors.add(:term_date, 'can not be future time') if term_date > Time.now
    end

    def cannot_be_future_date
        errors.add(:birthday, 'can not be future date') if birthday > Date.today
    end

    def downcase_email
        if self.email != nil
            self.email = self.email.downcase
        end
        if self.email_confirmation != nil
            self.email_confirmation = self.email.downcase
        end
    end
end
