class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :first_name, :last_name, :phone_no])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role, :first_name, :last_name, :phone_no])
	end
end
