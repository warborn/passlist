class Group < ActiveRecord::Base
  # A group has many class days
  has_many :classdays, dependent: :destroy
  # A group has many classes specified through the class day
  has_many :classes, -> { order "date ASC" },
                     through: :classdays,
                     class_name: "CourseClass",
                     foreign_key: "classday_id",
                     source: :course_classes # name of the association in Classday model

  has_and_belongs_to_many :students

  # def classes
  #   CourseClass.where(classday_id: classdays.map(&:id))
  # end

  def add_class_to_day(new_class)
    # english_day = new_class.date.strftime("%A")
    # spanish_day = day_english_to_spanish(english_day)
    spanish_day = I18n.l(new_class.date, format: "%A")

    classdays.each do |classday|
      if classday.day == spanish_day
        classday.course_classes << new_class
      end
    end
  end

  def add_new_student(student)
    self.students << student unless self.students.include?(student)
  end

  def generate_calendar!(classdays)
    classdays.each do |classday|
      self.classdays << Classday.new(day: classday["day"], begin_time: classday["begin_time"], end_time: classday["end_time"])
    end
    #
    # begin_date = Date.parse("2016-02-01")
    # end_date   = Date.parse("2016-05-27")
    counter = 0
    while((current_date = begin_date + counter) <= end_date)
      self.add_class_to_day(CourseClass.new(date: current_date.to_s))
      counter += 1
    end
  end

  private

    # def day_spanish_to_english(spanish_day)
    #   english_day = case spanish_day.downcase
    #     when 'lunes' then 'Monday'
    #     when 'martes' then 'Tuesday'
    #     when 'miercoles' then 'Wednesday'
    #     when 'jueves' then 'Thursday'
    #     when 'viernes' then 'Friday'
    #     when 'sabado' then 'Saturday'
    #     when 'domingo' then 'Sunday'
    #   end
    # end

    # def day_english_to_spanish(english_day)
    #   spanish_day = case english_day.downcase
    #   when 'monday' then 'Lunes'
    #   when 'tuesday' then 'Martes'
    #   when 'wednesday' then 'Miercoles'
    #   when 'thursday' then 'Jueves'
    #   when 'friday' then 'Viernes'
    #   when 'saturday' then 'Sabado'
    #   when 'sunday' then 'Domingo'
    #   end
    # end
end
