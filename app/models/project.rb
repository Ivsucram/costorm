class Project < ActiveRecord::Base
	belongs_to :author, class_name: "User"
	has_many :ideas, dependent: :destroy
end
