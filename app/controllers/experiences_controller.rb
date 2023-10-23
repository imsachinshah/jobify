class ExperiencesController < ApplicationController
  def new
    seeker = current_user if current_user.seeker?
    @experience = seeker.experiences.new()
  end

  def  create
    seeker = current_user if current_user.seeker?
    @experience = seeker.experiences.new(exp_params)

    if @experience.save
      redirect_to users_profile_path(seeker)
    end

  end

  def edit
  end

  private
    def exp_params
      params.require(:experience).permit(:role, :company_name, :year_of_exp)
    end
end
