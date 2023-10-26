class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :set_user

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :first_name, :last_name, :phone_no])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role, :first_name, :last_name, :phone_no])
	end

	def after_sign_in_path_for(resources) 
     jobs_path
	end

	private 
		def set_user
			# cookies[:user_id] = current_user.id || 0 if user.signed_in?
		end
end
