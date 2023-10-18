class RemoveColFromSkills < ActiveRecord::Migration[7.0]
  def change
    remove_column :skills, :user_id, :references
  end
end
