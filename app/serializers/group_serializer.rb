class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :subject, :retardment, :time_limit, :begin_date, :end_date

  # has_many :classes

  def time_limit
    object.time_limit.strftime("%H:%M")
  end
end
