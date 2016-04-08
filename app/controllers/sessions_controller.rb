class SessionsController < DeviseTokenAuth::SessionsController
  private

    def resource_params
  		params.require(:user).permit(:email, :password)
  	end

end
