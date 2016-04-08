class RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  	def sign_up_params
  		params.require(:user).permit(:last_name, :maiden_name, :first_name, :email, :password, :password_confirmation)
  	end

  	def account_update_params
  		params.require(:user).permit(:last_name, :maiden_name, :first_name, :email, :password, :password_confirmation)
  	end
end
