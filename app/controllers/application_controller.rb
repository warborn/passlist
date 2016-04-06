class ApplicationController < ActionController::API

  def serialize(object)
    if object.is_a?(Array)
      object.map do |item|
        ActiveModel::SerializableResource.new(item)
      end
    else
      ActiveModel::SerializableResource.new(object)
    end
  end

end
