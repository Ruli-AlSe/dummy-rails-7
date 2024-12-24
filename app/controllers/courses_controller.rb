class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.where(visible: true)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create course_params
    redirect_to courses_path
  end

  def show
  end

  def edit
  end

  def update
    @course.update course_params
    redirect_to courses_path
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :visible, :published)
  end
end
