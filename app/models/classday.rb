class Classday < ActiveRecord::Base
  belongs_to :group
  has_many :course_classes, dependent: :destroy

  scope :sort_days, -> { order('CASE Day WHEN "Lunes" THEN 1 WHEN "Martes" THEN 2 WHEN "Miércoles" THEN 3 WHEN "Jueves" THEN 4 WHEN "Viernes" THEN 5 WHEN "Sábado" THEN 6 WHEN "Domingo" THEN 7 END') }

  # Validations
  validates :day, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validate :unique_classday_for_group

  def unique_classday_for_group
    if self.group
      self.errors.add(:day, 'is already taken') if group.classdays.where(day: self.day).exists?
    end
  end
end
