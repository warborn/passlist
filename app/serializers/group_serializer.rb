class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :retardment, :time_limit

  def time_limit
    object.time_limit.strftime("%H:%M")
  end
end
