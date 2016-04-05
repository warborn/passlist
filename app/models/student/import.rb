class Student::Import
  include ActiveModel::Model

  attr_accessor :file, :imported_count, :updated_count, :new_record, :imported_students, :group

  def process!
    @imported_count = 0
    @updated_count = 0
    @imported_students = []
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      student = Student.assign_from_row(row)
      @new_record = student.new_record?
      @group.students << student unless @group.students.include?(student)

      @group.classes.each do |course_class|
        if course_class.has_assists?
          course_class.assists <<  Assist.new(student_id: student.id, course_class_id: course_class.id)
        end
      end

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
