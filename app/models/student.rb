class Student < ActiveRecord::Base
  # The current class for the student
  attr_accessor :current_class

  has_many :assists

  # Serialize a student through ActiveModelSerializers
  def self.serialize(student)
    ActiveModel::SerializableResource.new(student)
  end

  # Assign attributes to a student from a hash
  def self.assign_from_row(row)
    student = Student.where(account_number: row[:account_number]).first_or_initialize
    student.assign_attributes row.to_hash.slice(:last_name, :maiden_name, :first_name)
    student
  end
end