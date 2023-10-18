class SkillsController < ApplicationController 
	def index
	end

	def create
		@job = current_user.jobs.find(params[:job_id])
		@skill = @job.skills.create(skills_param)
		redirect_to job_url(@job)
	end

	# debugger

	def destroy
		@job = current_user.jobs.find(params[:job_id])
		@skill = @job.skills.find(params[:id])
		@skill.destroy
		redirect_to job_url(@job), status: :see_other
	end


	private
	def skills_param
		params.require(:skill).permit(:name, :skillable_type, :skillable_id, :_destroy)
	end

end