class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, except: [:index]
# before_action :authenticate_viewer!, except: [:index]

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:familyname, :firstname, :office, :location])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:familyname, :firstname, :office, :location])
      devise_parameter_sanitizer.permit(:account_update, keys:[:familyname, :firstname, :office, :location])
    end

    def after_sign_in_path_for(resource)
       user_path(current_user)
    end


end
