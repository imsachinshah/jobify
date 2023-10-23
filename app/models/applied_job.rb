class AppliedJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  enum :status, [:applied, :rejected, :selected], default: :applied
end
