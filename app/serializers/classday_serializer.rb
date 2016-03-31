class ClassdaySerializer < ActiveModel::Serializer
  attributes :id, :day, :begin_time, :end_time, :group_id

  def begin_time
    object.begin_time.strftime("%H:%M")
  end

  def end_time
    object.end_time.strftime("%H:%M")
  end
end
