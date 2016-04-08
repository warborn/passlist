class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def serialize(object)
    ActiveModel::SerializableResource.new(object)
  end
  
  # protected

  #   def configure_permitted_parameters
  #     # byebug
  #     # devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :maiden_name, :first_name])
  #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:last_name, :maiden_name, :first_name, :email, :password, :password_confirmation) }
  #   end

end
