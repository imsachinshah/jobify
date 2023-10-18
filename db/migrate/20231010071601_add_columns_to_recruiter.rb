class AddColumnsToRecruiter < ActiveRecord::Migration[7.0]
  def change
    add_column :recruiters, :name, :string
    add_column :recruiters, :company_name, :string
  end
end
