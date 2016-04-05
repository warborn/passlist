class CourseClass < ActiveRecord::Base
  belongs_to :classday
  has_many :assists
  has_one :group, through: :classday

  def has_assists?
    self.assists.size > 0
  end
end
