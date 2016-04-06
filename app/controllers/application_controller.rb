class ApplicationController < ActionController::API

  def serialize(object)
    ActiveModel::SerializableResource.new(object)
  end

end
