class CreateAppliedJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :applied_jobs do |t|
      t.integer :status
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.timestamps
    end
  end
end
