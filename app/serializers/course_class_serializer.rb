class CourseClassSerializer < ActiveModel::Serializer
  attributes :id, :date, :active

  def date
    # object.date.strftime("%A %d de %B del %Y")
    I18n.l(object.date, format: "%A %d de %B del %Y")
  end
end
