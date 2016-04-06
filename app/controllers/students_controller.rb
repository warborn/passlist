class StudentsController < ApplicationController

  def assist
    @course_class = CourseClass.find(params[:course_class_id])
    @student = Student.find(params[:id])

    @assist = Assist.where(course_class_id: @course_class.id, student_id: @student.id).first
    if @assist
      @assist.toggle(:assist).save
      render json: @assist
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @student = Student.new(student_params)

    if @student.save
      @group.students << @student
      @group.classes.each do |course_class|
        if course_class.assists.size > 0
          course_class.add_assist_for(@student)
        end
      end
      render json: @student, status: :created
    else
      render json: @student.errors, status: 400
    end
  end

  def import
    @import = Student::Import.new(student_import_params)
    @import.group = Group.find(params[:group_id])

    if @import.save
      render json: {
        imported_count: @import.imported_count,
        updated_count: @import.updated_count,
        imported_students: serialize(@import.imported_students)
      }, status: :created
    else
      render json: {"status": "error"}
    end
  end

  private

    def student_import_params
      params.require(:student_import).permit(:file)
    end

    def student_params
      params.require(:student).permit(:last_name, :maiden_name, :first_name, :account_number)
    end

end
