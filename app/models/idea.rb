class Idea < ActiveRecord::Base
	has_many :idea_points

	belongs_to :project
	belongs_to :user

	has_many :idea_keywords
	has_many :keywords, class_name: "Keyword", through: :idea_keywords, :source => :keyword, :foreign_key => "idea_id"

	validates :project_id,
      			presence: true
    validates :user_id,
      			presence: true
    validates :description,
      			presence: true

    scope :positive_points, -> { idea_points.where(vote: true).count }

	def positive_points2
		self.idea_points.where(vote: true).count
	end

	def negative_points
		self.idea_points.where(vote: false).count
	end

	def points
		self.positive_points-self.negative_points
	end

	def percentage_positive_points
		(self.positive_points*100)/(self.positive_points+self.negative_points)
	end

	def percentage_negative_points
		(self.negative_points*100)/(self.positive_points+self.negative_points)
	end

	def positive_points_users
		array_of_users = Array.new
		self.idea_points.where(vote: true).each { |idea| array_of_users << idea.user }
		array_of_users.uniq
	end

	def negative_points_users
		array_of_users = Array.new
		self.idea_points.where(vote: false).each { |idea| array_of_users << idea.user }
		array_of_users.uniq
	end

	def users_that_voted
		array_of_users = Array.new
		self.idea_points.each { |idea| array_of_users << idea.user }
		array_of_users.uniq
	end

	def positive_points_percentage
		self.percentage_positive_points
	end

	def negative_points_percentage
		self.percentage_negative_points
	end

	def voting_users
		self.users_that_voted
	end
end
