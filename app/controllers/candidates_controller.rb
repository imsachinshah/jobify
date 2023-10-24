class CandidatesController < ApplicationController
  def index
    if current_user.recruiter?
      @jobs = current_user.jobs
      @applied_jobs = AppliedJob.all
      
      # @applied_jobs = AppliedJob.where(user_id: current_user.id).pluck(:job_id)
    end
    # @jobs = Job.find(applied_job.job_id)
    # @recruiter = @job.user
    # @seeker = User.find(applied_job.user_id)

  end
end
