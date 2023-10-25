class AppliedJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  enum :status, [:applied, :not_selected, :selected], default: :applied
  enum :recruiter_status, [:shortlisted, :rejected, :not_set], default: :not_set
end
