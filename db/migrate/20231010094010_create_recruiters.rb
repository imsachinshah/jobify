class CreateRecruiters < ActiveRecord::Migration[7.0]
  def change
    drop_table :recruiters
    create_table :recruiters do |t|
      t.string :name

      t.timestamps
    end
  end
end
