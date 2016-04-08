class ApplicationController < ActionController::API

  include DeviseTokenAuth::Concerns::SetUserByToken

  def serialize(object)
    ActiveModel::SerializableResource.new(object)
  end

end
