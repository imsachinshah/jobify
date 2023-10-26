class AddRazorpayColToAppliedJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :applied_jobs, :razorpay_order_id, :string
  end
end
