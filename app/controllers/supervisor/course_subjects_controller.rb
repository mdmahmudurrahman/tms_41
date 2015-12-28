class Supervisor::CourseSubjectsController < ApplicationController
  
  def edit
    @course_subject = CourseSubject.find params[:id]
    @course = @course_subject.course
    @subject = @course_subject.subject
  end

  def update
    @course_subject = CourseSubject.find params[:id]
    if @course_subject.update_attributes course_subject_params
      @course = @course_subject.course
      flash[:success] = t :task_modified_successfully,
        course_name: @course_subject.course.name,
        subject_name: @course_subject.subject.name
      redirect_to [:supervisor, @course]
    else
      render :edit
    end
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :id, :task_ids
  end
end
