class Assist < ActiveRecord::Base
  belongs_to :student
  belongs_to :course_class
end
