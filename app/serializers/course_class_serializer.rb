class CourseClassSerializer < ActiveModel::Serializer
  attributes :id, :date, :active, :students

  # Serializer all students that belongs to the class group
  def students
    object.group.students.map do |student|
      Student.serialize(student)
    end
  end

  def date
    # object.date.strftime("%A %d de %B del %Y")
    I18n.l(object.date, format: "%A %d de %B del %Y")
  end
end
