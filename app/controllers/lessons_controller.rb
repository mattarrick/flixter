class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
  end

  private

  def require_authorized_for_current_lesson
    @course = current_lesson.section.course
    if current_user.enrolled_in?(@course) == false
      # flash[:alert] = "You must be enrolled in the course to view this lesson"
      redirect_to course_path(@course), alert: 'You must enroll in this course to view the course lessons.'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
