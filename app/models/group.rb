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

  accepts_nested_attributes_for :classdays

  # Validation
  validates :name, presence: true
  validates :time_limit, presence: true
  validates :subject, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true

  # def classes
  #   CourseClass.where(classday_id: classdays.map(&:id))
  # end

  def add_classes_to_day(classday)
    counter = 0
    day_found = false
    while((current_date = begin_date + counter) <= end_date)
      spanish_day = I18n.l(current_date, format: "%A")
      if(!day_found && (spanish_day == classday.day))
        day_found = true
      elsif(day_found)
        classday.course_classes << CourseClass.new(date: current_date)
        counter += 7
      else
        counter += 1
      end
    end
    # english_day = new_class.date.strftime("%A")
    # spanish_day = day_english_to_spanish(english_day)
  end

  def add_new_student(student)
    self.students << student unless self.students.include?(student)
  end

  # def generate_calendar!
  #   counter = 0
  #   while((current_date = begin_date + counter) <= end_date)
  #     self.add_class_to_day(CourseClass.new(date: current_date.to_s))
  #     counter += 1
  #   end
  # end

  def generate_calendar!
    self.classdays.each do |classday|
      if classday.course_classes.empty?
        self.add_classes_to_day(classday)
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
