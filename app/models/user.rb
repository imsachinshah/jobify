class User < ApplicationRecord

	has_many :educations
	has_many :experiences
	has_one :address
	has_many :user_skills
	has_many :skills, through: :user_skills
	
end
