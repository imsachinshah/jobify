class Experience < ApplicationRecord
	belongs_to :user, optional: true
end
