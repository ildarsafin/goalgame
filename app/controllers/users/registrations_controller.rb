module Users
  class RegistrationsController < Devise::RegistrationsController
    layout "onboard"

    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:email, :password, :password_confirmation, profile_attributes: [:full_name])
      end
    end
  end
end
