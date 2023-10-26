class UserMailer < ApplicationMailer

	def job_applied_mail(applied_job)
		@job = Job.find(applied_job.job_id)
		@recruiter = @job.user
		@seeker = User.find(applied_job.user_id)
		@applied_job = applied_job
		mail(to: @recruiter.email, subject: "New Job Applicant")
	end

	def seeker_job_applied_mail(applied_job)
		@job = Job.find(applied_job.job_id)
		@recruiter = @job.user
		@seeker = User.find(applied_job.user_id)
		@applied_job = applied_job
		mail(to: @seeker.email, subject: "Successfully applied for the Job")
	end

	def shortlisted_mail(applied_job)
		info(applied_job)
		mail(to: @seeker.email, subject: "Congrats!!! you're shortlisted for the Job")
	end

	def rejected_mail(applied_job)
		info(applied_job)
		mail(to: @seeker.email, subject: "Regarding: Your job you have applied")
	end

	def interview_payment_success_mail(applied_job)
		info(applied_job)
		mail(to: @seeker.email, subject: "Regarding: Interview secheduling ")
	end

	private
		def info(applied_job)
		@job = Job.find(applied_job.job_id)
		@recruiter = @job.user
		@seeker = User.find(applied_job.user_id)
		@applied_job = applied_job
		end
end
