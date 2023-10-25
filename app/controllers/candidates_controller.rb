class CandidatesController < ApplicationController
  def index
    if current_user.recruiter?
      @applied_jobs = AppliedJob.all
    end
  end

  def show
    @candidate = User.find(params[:user_id])
    @job = Job.find(params[:job_id])
    @applied_job = AppliedJob.find_by(job_id: params[:job_id])
  end

end
