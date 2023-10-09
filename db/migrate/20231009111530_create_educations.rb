class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :course_name
      t.string :institution_name
      t.date :year_of_passing
      t.integer :grade
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
