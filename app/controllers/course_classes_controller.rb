class CourseClassesController < ApplicationController

  def active
    @course_class = CourseClass.find(params[:id])
    if @course_class.toggle(:active).save
      render json: @course_class, status: 200
    else
      render json: @course_class.errors
    end
  end

  def show
    @course_class = CourseClass.find(params[:id])
    @students = @course_class.group.students

    @students.each do |student|
      student.current_class = @course_class
    end

    render json: @course_class
  end

  def generate
    @course_class = CourseClass.find(params[:id])
    if @course_class.assists.size == 0

      @students = @course_class.group.students
      @students.each do |student|
        Assist.create(student_id: student.id, course_class_id: @course_class.id)
      end
    end
  end
end
