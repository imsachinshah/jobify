class Experience < ApplicationRecord
	belongs_to :user, optional: true

	validates_presence_of :role, :company_name, :year_of_exp

end
