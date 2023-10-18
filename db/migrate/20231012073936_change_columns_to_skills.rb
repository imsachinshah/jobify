class ChangeColumnsToSkills < ActiveRecord::Migration[7.0]
  def change
    remove_column :skills, :name, :string
    add_column :skills, :predefined_skills_id, :integer
  end
end
