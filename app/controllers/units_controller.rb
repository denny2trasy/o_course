class UnitsController < ContentsController

  def show
    @course = Course.find(params[:course_id])
    @unit = @course.units.find(params[:id])
    @lessons = @unit.lessons
  end

end