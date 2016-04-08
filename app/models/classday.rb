class Classday < ActiveRecord::Base
  belongs_to :group
  has_many :course_classes, dependent: :destroy

  # Validations
  validates :day, presence: true
  validates :begin_time, presence: true
  validates :end_time, presence: true
end
