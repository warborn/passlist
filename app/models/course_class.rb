class CourseClass < ActiveRecord::Base
  belongs_to :classday
  has_one :group, through: :classday
end
