class AddRefToJob < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :recruiter, index: true
  end
end
