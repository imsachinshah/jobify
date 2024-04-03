class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :street, presence: true
end
