class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	enum role: [:seeker, :recruiter]

	has_many :educations
	has_many :experiences
	has_one :address
	has_many :skills, as: :skillable
	has_many :jobs

end
