class Experience < ApplicationRecord
	belongs_to :users, optional: true
end
