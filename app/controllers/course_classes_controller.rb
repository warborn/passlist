class CourseClassesController < ApplicationController
  before_action :generate_assists, only: [:show]

  def active
    @course_class = CourseClass.find(params[:id])
    if @course_class.toggle(:active).save
      render json: @course_class, status: 200
    else
      render json: @course_class.errors
    end
  end

  def show
    @students.each do |student|
      student.current_class = @course_class
    end

    # byebug

    render json: {
      "classes": serialize(@course_class),
      "students": serialize(@students)
    }
  end

  private
    def generate_assists
      @course_class = CourseClass.find(params[:id])
      @students = @course_class.group.students
      @course_class.add_assist_for(@students)
    end
end
