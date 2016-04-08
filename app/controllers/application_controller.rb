class ApplicationController < ActionController::API

  include DeviseTokenAuth::Concerns::SetUserByToken

  def serialize(object)
    ActiveModelSerializers::SerializableResource.new(object)
  end

end
