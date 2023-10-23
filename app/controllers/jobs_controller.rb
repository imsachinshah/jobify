class JobsController < ApplicationController


  def index
    if current_user.seeker?
      @jobs = Job.all
      @jobs = @jobs.filter_by_type(params[:job_type]) if params[:job_type].present?
      @jobs = @jobs.filter_by_location(params[:location]) if params[:location].present?
      @jobs = @jobs.filter_by_company(params[:company_name]) if params[:company_name].present?
      @applied_jobs = AppliedJob.pluck(:job_id)
    else
      @jobs = current_user.jobs
      @jobs = @jobs.filter_by_type(params[:job_type]) if params[:job_type].present?
      @jobs = @jobs.filter_by_location(params[:location]) if params[:location].present?
      @jobs = @jobs.filter_by_company(params[:company_name]) if params[:company_name].present?
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @job.skills.build
  end

  def create
    @job = current_user.jobs.new(jobs_params)

    if @job.save
      redirect_to @job
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @job = current_user.jobs.find(params[:id])
  end

  def update
    @job = current_user.jobs.find(params[:id])

    if @job.update(jobs_params)
      redirect_to @job 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job = current_user.jobs.find(params[:id])
    @job.destroy
    redirect_back_or_to({action: :index}) 
  end

  private
    def jobs_params
       params.require(:job).permit(:title, :desc, :job_type, :no_of_vac, :pay, :company_name, :location, :_destroy)
    end
end
