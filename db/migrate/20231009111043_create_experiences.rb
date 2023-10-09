class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :role
      t.string :company_name
      t.integer :year_of_exp
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
