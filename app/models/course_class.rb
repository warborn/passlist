class CourseClass < ActiveRecord::Base
  belongs_to :classday
  has_many :assists
  has_one :group, through: :classday
end
