class CourseClass < ActiveRecord::Base
  belongs_to :classday
  has_many :assists, dependent: :destroy
  has_one :group, through: :classday

  validates :date, presence: true

  def has_assists?
    self.assists.size > 0
  end

  def add_assist_for(object)
    if object.respond_to?("each")
      object.each do |student|
        Assist.where(course_class_id: self.id, student_id: student.id).first_or_create
      end
    else
      Assist.where(course_class_id: self.id, student_id: object.id).first_or_create
    end
  end
end
