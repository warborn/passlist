class Classday < ActiveRecord::Base
  belongs_to :group
  has_many :course_classes
end
