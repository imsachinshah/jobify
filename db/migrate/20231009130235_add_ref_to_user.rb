class AddRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :user_skills, index: true
  end
end
