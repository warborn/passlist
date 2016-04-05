class Student::Import
  include ActiveModel::Model

  attr_accessor :file, :imported_count, :updated_count, :new_record, :imported_students

  def process!
    @imported_count = 0
    @updated_count = 0
    @imported_students = []
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      student = Student.assign_from_row(row)
      @new_record = student.new_record?
      if student.save
        if @new_record
          @imported_count+= 1
          @imported_students << student
        else
          @updated_count += 1
          @imported_students << student
        end
      else
        errors.add(:base, "#{$.} - #{todo.errors.full_messages.join(",")}")
      end
    end
  end

  def save
    process!
    errors.none?
  end

  def self.serialize_students(students)
    students.map do |student|
      ActiveModel::SerializableResource.new(student)
    end
  end
end
