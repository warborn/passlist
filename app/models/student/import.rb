class Student::Import
  include ActiveModel::Model

  attr_accessor :file

  def process!
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      student = Student.assign_from_row(row)
      if student.save
        
      else
        errors.add(:base, "#{$.} - #{todo.errors.full_messages.join(",")}")
      end
    end
  end

  def save
    process!
    errors.none?
  end
end
