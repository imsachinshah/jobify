class AddColumnToAppliedJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :applied_jobs, :recruiter_status, :integer
  end
end
