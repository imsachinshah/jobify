class AddPaymentIdToAppliedJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :applied_jobs, :razorpay_payment_id, :string
  end
end
