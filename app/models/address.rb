class Address < ApplicationRecord
  belongs_to :users, optional: true
end
