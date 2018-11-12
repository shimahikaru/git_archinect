class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :authenticate_viewer!, except: [:index]

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:familyname])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:familyname])
      devise_parameter_sanitizer.permit(:account_update, keys:[:familyname])
    end

    def after_sign_in_path_for(resource)
       user_path(current_user)
    end


end
