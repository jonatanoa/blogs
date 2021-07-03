class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?  # esto se hace para que este 
            #before-action no se ejecute en todos los controladores, solo en aquellos que sean de devise
    
    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    end
    
end
