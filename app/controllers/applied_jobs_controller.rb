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

end
