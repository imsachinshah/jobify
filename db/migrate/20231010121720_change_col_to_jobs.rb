class ChangeColToJobs < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :recruiter_id, :user_id
  end
end
