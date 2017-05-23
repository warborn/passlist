class Student::Import
  include ActiveModel::Model

  attr_accessor :file, :imported_count, :updated_count, :new_record, :imported_students, :group

  def process!
    unless @file.blank?
      @imported_count = 0
      @updated_count = 0
      @imported_students = []
      CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
        student = Student.assign_from_row(row)
        @new_record = student.new_record?

        if student.save
          @group.add_new_student(student)

          @group.classes.each do |course_class|
            if course_class.has_assists?
              course_class.add_assist_for(student)
            end
          end

          if @new_record
            @imported_count+= 1
          else
            @updated_count += 1
          end
          @imported_students << student
        else
          errors.add(:errors, "#{$.} - #{student.errors.full_messages.join(",")}")
        end
      end
    else
      errors.add(:errors, "No file was sended")
    end
  end

  def save
    process!
    errors.none?
  end

end
