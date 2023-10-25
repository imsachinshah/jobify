class AppliedJobsController < ApplicationController

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

	private

		def applied_job_params
			params.require(:applied_job).permit(:recruiter_status)
		end

end
