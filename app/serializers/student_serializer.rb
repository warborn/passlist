class StudentSerializer < ActiveModel::Serializer
  attributes :id, :account_number, :last_name, :maiden_name, :first_name, :assist

  # Get assist value for the student of the class given by the current_class attribute
  def assist
    object.current_class.assists.where(student_id: object.id).first.assist
  end
end
