class Job < ApplicationRecord
	has_many :skills, as: :skillable, dependent: :destroy
	belongs_to :user
   	# accepts_nested_attributes_for :skills

    scope :filter_by_type, -> (job_type) { where job_type: job_type }
    scope :filter_by_location, -> (location) { where("location LIKE ?", "%#{location}%")}
    scope :filter_by_company, -> (company) { where("company_name LIKE ?", "%#{company}%") }

	enum :job_type, [:internship, :fulltime]
end
