class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:familyname, :firstname, :office])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:familyname, :firstname, :office])
      devise_parameter_sanitizer.permit(:account_update, keys:[:familyname, :firstname, :office])
    end

end
