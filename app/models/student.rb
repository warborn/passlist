class Student < ActiveRecord::Base
  # The current class for the student
  attr_accessor :current_class

  has_many :assists

  # Serialize a student through ActiveModelSerializers
  def self.serialize(student)
    ActiveModel::SerializableResource.new(student)
  end
end
