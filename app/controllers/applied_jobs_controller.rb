class AppliedJobsController < ApplicationController

	before_action :check_payment_id, only: [:payment_invoice] 
  
	def index
		@applied_jobs = current_user.applied_jobs
		@shortlisted_jobs = @applied_jobs.shortlisted
		@rejected_jobs = @applied_jobs.rejected
		@payment_success_jobs = @shortlisted_jobs.where.not(razorpay_payment_id: nil).pluck(:job_id)
	end

	def create
		@applied_job = current_user.applied_jobs.new(job_id: params[:job_id])
		if @applied_job.save
			applied_job = AppliedJob.last
			UserMailer.job_applied_mail(applied_job).deliver_later
			UserMailer.seeker_job_applied_mail(applied_job).deliver_later
			redirect_to jobs_path
		end
	end

	def edit 
		@applied_job = AppliedJob.find(params[:id])
	end

	def update
		@applied_job = AppliedJob.find(params[:id])
    @applied_job.update(applied_job_params)	
    applied_job = @applied_job

    if @applied_job.shortlisted?
    	UserMailer.shortlisted_mail(applied_job).deliver_later
    else
    	UserMailer.rejected_mail(applied_job).deliver_later
    end
	end

	def payment_invoice
		@shortlisted_job = AppliedJob.find(params[:id])
		@order = Razorpay::Order.create amount: 100000, currency: 'INR', receipt: 'TEST'
		@shortlisted_job.update(razorpay_order_id: @order.id)
	end

	def payment_success
		shortlisted_job = AppliedJob.find(params[:job_id])	
	  shortlisted_job.update(razorpay_payment_id: params[:razorpay_payment_id])
    

		if shortlisted_job[:razorpay_payment_id] != nil
			UserMailer.interview_payment_success_mail(shortlisted_job).deliver_later
			redirect_to job_path(shortlisted_job.job.id)
		end
	end

	private
 
    def check_payment_id
      @shortlisted_job = AppliedJob.find(params[:id])
      if @shortlisted_job.razorpay_payment_id.present?  
      	flash[:error]="Your Payment Is Already Done" 
      	redirect_to "/jobs/#{@shortlisted_job.job.id}"
      end
    end

		def applied_job_params
			params.require(:applied_job).permit(:recruiter_status)
		end

end
