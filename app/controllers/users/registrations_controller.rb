module Users
  class RegistrationsController < Devise::RegistrationsController
    layout "onboard"
  end
end
