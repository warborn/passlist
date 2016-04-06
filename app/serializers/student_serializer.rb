class StudentSerializer < ActiveModel::Serializer
  attributes :id, :account_number, :last_name, :maiden_name, :first_name

  def attributes(*args)
     hash = super
     # Conditionally set the assist (true/false) attribute of the student if a current class is given
     hash[:assist] = assist if object.current_class
     hash
  end

  # Get assist value for the student of the class given by the current_class attribute
  def assist
    object.current_class.assists.where(student_id: object.id).first.assist
  end
end
