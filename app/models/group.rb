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

  def add_class_to_day(new_class)
    # english_day = new_class.date.strftime("%A")
    # spanish_day = day_english_to_spanish(english_day)
    spanish_day = I18n.l(new_class.date, format: "%A")
    puts spanish_day

    classdays.each do |classday|
      if classday.day == spanish_day
        classday.course_classes << new_class
      end
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
