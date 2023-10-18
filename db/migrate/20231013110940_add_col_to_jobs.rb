class AddColToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :company_name, :string
    add_column :jobs, :location, :string
    change_column :jobs, :desc, :text
  end
end
