class AlterColFromSkills < ActiveRecord::Migration[7.0]
  def change
    remove_column :skills, :predefined_skills_id, :integer
    add_column :skills, :name, :string
    drop_table :predefined_skills
  end
end
