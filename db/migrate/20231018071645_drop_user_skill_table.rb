class DropUserSkillTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_skills
  end
end
