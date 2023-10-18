class CreatePredefinedSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :predefined_skills do |t|
      t.string :name

      t.timestamps
    end
  end
end
