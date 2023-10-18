class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :desc
      t.integer :type
      t.integer :no_of_vac
      t.integer :pay

      t.timestamps
    end
  end
end
