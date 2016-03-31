class Group < ActiveRecord::Base
  # A group has many class days
  has_many :classdays
  # A group has many classes specified through the class day
  has_many :classes, -> { order "date ASC" },
                     through: :classdays,
                     class_name: "CourseClass",
                     foreign_key: "classday_id",
                     source: :course_classes # name of the association in Classday model

  # def classes
  #   CourseClass.where(classday_id: classdays.map(&:id))
  # end

end
