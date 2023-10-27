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

	has_many :applied_jobs

	has_one_attached :profile_picture
	has_one_attached :resume

	validates :email, uniqueness: true

end
