class CourseClassesController < ApplicationController

  def active
    @course_class = CourseClass.find(params[:id])
    if @course_class.toggle(:active).save
      render json: @course_class, status: 200
    else
      render json: @course_class.errors
    end
  end

end
